import 'package:flutter/material.dart';
import '../models/plan.dart';

class PlanProvider with ChangeNotifier {
  final List<Plan> _plans = [];

  List<Plan> get plans => _plans;

  void addPlan(String name) {
    _plans.add(Plan(name: name));
    notifyListeners();
  }

  void updatePlan(int index, String newName) {
    _plans[index] = _plans[index].copyWith(name: newName);
    notifyListeners();
  }

  void toggleComplete(int index) {
    _plans[index] = _plans[index].copyWith(isCompleted: !_plans[index].isCompleted);
    notifyListeners();
  }

  void removePlan(int index) {
    _plans.removeAt(index);
    notifyListeners();
  }
}
