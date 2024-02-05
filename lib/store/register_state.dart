import 'package:mobx/mobx.dart';

part 'register_state.g.dart';

class RegisterState = _RegisterState with _$RegisterState;

abstract class _RegisterState with Store {
  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String? passwordError;

  @observable
  String confirmedPassword = '';

  @observable
  String? confirmPasswordError;

  @computed
  bool get isRegistrationEnabled =>
      username.isNotEmpty &&
      password.isNotEmpty &&
      password == confirmedPassword &&
      passwordError == null;

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void confirmPassword(String value) {
    confirmedPassword = value;
  }

  @action
  void validatePassword(String value) {
    setPassword(value);
    final regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$',
    );
    if (value.isEmpty) {
      passwordError = 'Please enter a password';
    } else if (!regex.hasMatch(value)) {
      passwordError = 'Enter a valid password';
    } else {
      passwordError = null;
    }
  }

  @action
  void passwordConfirmation(String value) {
    confirmedPassword = value;
    if (confirmedPassword != password) {
      confirmPasswordError = 'Passwords do not match';
    } else {
      confirmPasswordError = null;
    }
  }
}
