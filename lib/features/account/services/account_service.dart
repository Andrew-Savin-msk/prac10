import 'package:get_it/get_it.dart';
import '../models/user_account_model.dart';
import 'package:prac10/features/activity_log/services/activity_log_service.dart';

class AccountService {
  UserAccount? _currentUser;
  final List<UserAccount> _registeredUsers = [];

  UserAccount? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  ActivityLogService get _logService => GetIt.I<ActivityLogService>();

  UserAccount register({
    required String name,
    required String email,
    required String password,
  }) {
    final exists = _registeredUsers.any((u) => u.email == email);
    if (exists) {
      throw Exception('Пользователь с таким email уже существует');
    }

    final user = UserAccount(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      password: password,
    );

    _registeredUsers.add(user);
    _currentUser = user;
    _logService.logAuthLogin(email);
    return user;
  }

  void login({
    required String email,
    required String password,
  }) {
    final user = _registeredUsers.firstWhere(
      (u) => u.email == email && u.password == password,
      orElse: () => throw Exception('Неверный email или пароль'),
    );
    _currentUser = user;
    _logService.logAuthLogin(email);
  }

  void logout() {
    _currentUser = null;
    _logService.logAuthLogout();
  }

  void updateProfile({
    required String name,
    required String email,
    String? avatarUrl,
  }) {
    if (_currentUser == null) return;

    _currentUser!
      ..name = name
      ..email = email
      ..avatarUrl = avatarUrl;
    _logService.logProfileUpdated(name, email);
  }
}

