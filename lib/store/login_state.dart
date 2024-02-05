import 'package:mobx/mobx.dart';

part 'login_state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  @observable
  String username = '';

  @observable
  String? passwordError;

  @observable
  String password = '';

  @computed
  bool get isLoginEnabled =>
      username.isNotEmpty && password.isNotEmpty && passwordError == null;

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void validatePassword(String value) {
    setPassword(value);
    final regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      passwordError = 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        passwordError = 'Enter valid password';
      } else {
        passwordError = null;
      }
    }
  }
}
