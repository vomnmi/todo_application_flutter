// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryState on _CategoryState, Store {
  late final _$selectedCategoryAtom =
      Atom(name: '_CategoryState.selectedCategory', context: context);

  @override
  int get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(int value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$_CategoryStateActionController =
      ActionController(name: '_CategoryState', context: context);

  @override
  void selectCategory(int index) {
    final _$actionInfo = _$_CategoryStateActionController.startAction(
        name: '_CategoryState.selectCategory');
    try {
      return super.selectCategory(index);
    } finally {
      _$_CategoryStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelection() {
    final _$actionInfo = _$_CategoryStateActionController.startAction(
        name: '_CategoryState.clearSelection');
    try {
      return super.clearSelection();
    } finally {
      _$_CategoryStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory}
    ''';
  }
}
