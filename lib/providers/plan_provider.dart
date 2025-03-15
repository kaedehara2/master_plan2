import 'package:flutter/material.dart';
import '../models/plan.dart';

class PlanProvider with ChangeNotifier {
  final List<Plan> _plans = [];

  List<Plan> get plans => _plans;

  // Menambahkan rencana baru
  void addPlan(String name) {
    _plans.add(Plan(name: name));
    notifyListeners();
  }

  // ✅ Perbaikan: Tambahkan metode updatePlan agar tidak error
  void updatePlan(int index, String newName) {
    if (index >= 0 && index < _plans.length) {
      _plans[index] = Plan(name: newName); // Update objek dengan membuat instance baru
      notifyListeners();
    }
  }
}
