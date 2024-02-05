// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginState on _LoginState, Store {
  Computed<bool>? _$isLoginEnabledComputed;

  @override
  bool get isLoginEnabled =>
      (_$isLoginEnabledComputed ??= Computed<bool>(() => super.isLoginEnabled,
              name: '_LoginState.isLoginEnabled'))
          .value;

  late final _$usernameAtom =
      Atom(name: '_LoginState.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_LoginState.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginState.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$_LoginStateActionController =
      ActionController(name: '_LoginState', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
passwordError: ${passwordError},
password: ${password},
isLoginEnabled: ${isLoginEnabled}
    ''';
  }
}
