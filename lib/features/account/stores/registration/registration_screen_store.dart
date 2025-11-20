import 'package:mobx/mobx.dart';
import 'package:prac10/features/account/services/account_service.dart';

part 'registration_screen_store.g.dart';

class RegistrationScreenStore = _RegistrationScreenStore
    with _$RegistrationScreenStore;

abstract class _RegistrationScreenStore with Store {
  _RegistrationScreenStore(this._accountService);

  final AccountService _accountService;

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  String? errorMessage;

  @computed
  bool get canRegister =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;

  @action
  void setName(String value) {
    name = value;
    errorMessage = null;
  }

  @action
  void setEmail(String value) {
    email = value;
    errorMessage = null;
  }

  @action
  void setPassword(String value) {
    password = value;
    errorMessage = null;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
    errorMessage = null;
  }

  @action
  void clearError() {
    errorMessage = null;
  }

  @action
  Future<bool> register() async {
    try {
      _accountService.register(
        name: name.trim(),
        email: email.trim(),
        password: password,
      );
      errorMessage = null;
      return true;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    }
  }
}

