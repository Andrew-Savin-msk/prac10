import 'package:mobx/mobx.dart';
import 'package:prac10/features/account/services/account_service.dart';
import 'package:prac10/features/account/models/user_account_model.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store {
  _ProfileScreenStore(this._accountService) {
    loadCurrentUser();
  }

  final AccountService _accountService;

  @observable
  UserAccount? user;

  @computed
  bool get isLoggedIn => user != null;

  @action
  void loadCurrentUser() {
    user = _accountService.currentUser;
  }
}

