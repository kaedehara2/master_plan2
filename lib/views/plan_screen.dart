import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:master_plan2/providers/plan_provider.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Rencana")),
      body: Consumer<PlanProvider>(
        builder: (context, planProvider, child) {
          return ListView.builder(
            itemCount: planProvider.plans.length,
            itemBuilder: (context, index) {
              final plan = planProvider.plans[index];
              return ListTile(
                title: Text(plan.name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PlanProvider>(context, listen: false).addPlan("Rencana Baru");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
