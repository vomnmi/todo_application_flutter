import 'package:mobx/mobx.dart';

part 'category_state.g.dart';

class CategoryState = _CategoryState with _$CategoryState;

abstract class _CategoryState with Store {
  @observable
  int selectedCategory = -1;

  @action
  void selectCategory(int index) {
    selectedCategory = index;
  }

  @action
  void clearSelection() {
    selectedCategory = -1;
  }
}
