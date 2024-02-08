import '../models/priority_model.dart';

class PriorityModelGenerator {
  static List<PriorityModel> generateCategories(int numberofPriorities) {
    return List.generate(numberofPriorities, (index) {
      return PriorityModel(
        iconPath: 'assets/icons/priority.svg',
        priorityNumber: index + 1,
      );
    });
  }
}

List<PriorityModel> priorities = PriorityModelGenerator.generateCategories(10);
