import 'package:flutter/material.dart';
import '../models/plan.dart';

class PlanProvider with ChangeNotifier {
  final List<Plan> _plans = [];

  List<Plan> get plans => List.unmodifiable(_plans);

  void addPlan(String name) {
    if (name.isNotEmpty) {
      _plans.add(Plan(name: name));
      notifyListeners();
    }
  }

  void updatePlan(int index, String newName) {
    if (index >= 0 && index < _plans.length && newName.isNotEmpty) {
      _plans[index] = _plans[index].copyWith(name: newName);
      notifyListeners();
    }
  }

  void toggleComplete(int index) {
    if (index >= 0 && index < _plans.length) {
      _plans[index] = _plans[index].copyWith(isCompleted: !_plans[index].isCompleted);
      notifyListeners();
    }
  }

  void removePlan(int index) {
    if (index >= 0 && index < _plans.length) {
      _plans.removeAt(index);
      notifyListeners();
    }
  }
}
