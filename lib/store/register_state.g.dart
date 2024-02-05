// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterState on _RegisterState, Store {
  Computed<bool>? _$isRegistrationEnabledComputed;

  @override
  bool get isRegistrationEnabled => (_$isRegistrationEnabledComputed ??=
          Computed<bool>(() => super.isRegistrationEnabled,
              name: '_RegisterState.isRegistrationEnabled'))
      .value;

  late final _$usernameAtom =
      Atom(name: '_RegisterState.username', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_RegisterState.password', context: context);

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

  late final _$passwordErrorAtom =
      Atom(name: '_RegisterState.passwordError', context: context);

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

  late final _$confirmedPasswordAtom =
      Atom(name: '_RegisterState.confirmedPassword', context: context);

  @override
  String get confirmedPassword {
    _$confirmedPasswordAtom.reportRead();
    return super.confirmedPassword;
  }

  @override
  set confirmedPassword(String value) {
    _$confirmedPasswordAtom.reportWrite(value, super.confirmedPassword, () {
      super.confirmedPassword = value;
    });
  }

  late final _$confirmPasswordErrorAtom =
      Atom(name: '_RegisterState.confirmPasswordError', context: context);

  @override
  String? get confirmPasswordError {
    _$confirmPasswordErrorAtom.reportRead();
    return super.confirmPasswordError;
  }

  @override
  set confirmPasswordError(String? value) {
    _$confirmPasswordErrorAtom.reportWrite(value, super.confirmPasswordError,
        () {
      super.confirmPasswordError = value;
    });
  }

  late final _$_RegisterStateActionController =
      ActionController(name: '_RegisterState', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_RegisterStateActionController.startAction(
        name: '_RegisterState.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_RegisterStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegisterStateActionController.startAction(
        name: '_RegisterState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void confirmPassword(String value) {
    final _$actionInfo = _$_RegisterStateActionController.startAction(
        name: '_RegisterState.confirmPassword');
    try {
      return super.confirmPassword(value);
    } finally {
      _$_RegisterStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_RegisterStateActionController.startAction(
        name: '_RegisterState.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_RegisterStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordConfirmation(String value) {
    final _$actionInfo = _$_RegisterStateActionController.startAction(
        name: '_RegisterState.passwordConfirmation');
    try {
      return super.passwordConfirmation(value);
    } finally {
      _$_RegisterStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
passwordError: ${passwordError},
confirmedPassword: ${confirmedPassword},
confirmPasswordError: ${confirmPasswordError},
isRegistrationEnabled: ${isRegistrationEnabled}
    ''';
  }
}
