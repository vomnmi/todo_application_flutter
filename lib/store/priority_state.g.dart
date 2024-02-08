// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priority_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PriorityState on _PriorityState, Store {
  late final _$selectedPriorityIndexAtom =
      Atom(name: '_PriorityState.selectedPriorityIndex', context: context);

  @override
  int get selectedPriorityIndex {
    _$selectedPriorityIndexAtom.reportRead();
    return super.selectedPriorityIndex;
  }

  @override
  set selectedPriorityIndex(int value) {
    _$selectedPriorityIndexAtom.reportWrite(value, super.selectedPriorityIndex,
        () {
      super.selectedPriorityIndex = value;
    });
  }

  late final _$_PriorityStateActionController =
      ActionController(name: '_PriorityState', context: context);

  @override
  void selectCategory(int index) {
    final _$actionInfo = _$_PriorityStateActionController.startAction(
        name: '_PriorityState.selectCategory');
    try {
      return super.selectCategory(index);
    } finally {
      _$_PriorityStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelection() {
    final _$actionInfo = _$_PriorityStateActionController.startAction(
        name: '_PriorityState.clearSelection');
    try {
      return super.clearSelection();
    } finally {
      _$_PriorityStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedPriorityIndex: ${selectedPriorityIndex}
    ''';
  }
}
