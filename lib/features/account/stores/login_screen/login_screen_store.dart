import 'package:mobx/mobx.dart';
import '../../services/account_service.dart';

part 'login_screen_store.g.dart';

class LoginScreenStore = _LoginScreenStore with _$LoginScreenStore;

abstract class _LoginScreenStore with Store {
  _LoginScreenStore(this._accountService);

  final AccountService _accountService;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String? errorMessage;

  @computed
  bool get canLogin => email.isNotEmpty && password.isNotEmpty;

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
  void clearError() {
    errorMessage = null;
  }

  @action
  Future<bool> login() async {
    try {
      _accountService.login(
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

