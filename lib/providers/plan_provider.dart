import 'package:flutter/material.dart';
import 'package:master_plan2/models/plan.dart';

class PlanProvider extends ChangeNotifier {
  final List<Plan> _plans = [];

  List<Plan> get plans {
    print("Mengambil daftar rencana: $_plans"); // Tambahkan print ini
    return _plans;
  }

  void addPlan(String name) {
    _plans.add(Plan(name: name));
    print("Menambah rencana: $name"); // Tambahkan print ini
    notifyListeners();
  }
}
