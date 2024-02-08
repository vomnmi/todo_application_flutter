import 'package:mobx/mobx.dart';

part 'priority_state.g.dart';

class PriorityState = _PriorityState with _$PriorityState;

abstract class _PriorityState with Store {
  @observable
  int selectedPriorityIndex = -1;

  @action
  void selectCategory(int index) {
    selectedPriorityIndex = index;
  }

  @action
  void clearSelection() {
    selectedPriorityIndex = -1;
  }
}
