import 'package:mobx/mobx.dart';
import '../../services/account_service.dart';

part 'edit_profile_screen_store.g.dart';

class EditProfileScreenStore = _EditProfileScreenStore
    with _$EditProfileScreenStore;

abstract class _EditProfileScreenStore with Store {
  _EditProfileScreenStore(this._accountService) {
    final currentUser = _accountService.currentUser;
    if (currentUser != null) {
      name = currentUser.name;
      email = currentUser.email;
      avatarUrl = currentUser.avatarUrl;
    }
  }

  final AccountService _accountService;

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String? avatarUrl;

  @observable
  String? errorMessage;

  @computed
  bool get canSave => name.isNotEmpty && email.isNotEmpty;

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
  void setAvatarUrl(String? value) {
    avatarUrl = value;
    errorMessage = null;
  }

  @action
  void clearError() {
    errorMessage = null;
  }

  @action
  Future<bool> save() async {
    try {
      _accountService.updateProfile(
        name: name.trim(),
        email: email.trim(),
        avatarUrl: avatarUrl,
      );
      errorMessage = null;
      return true;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    }
  }
}

