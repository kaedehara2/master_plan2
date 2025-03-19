import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:master_plan2/providers/plan_provider.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Rencana", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: Consumer<PlanProvider>(
        builder: (context, planProvider, child) {
          return planProvider.plans.isEmpty
              ? const Center(
                  child: Text(
                    "Belum ada rencana.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: planProvider.plans.length,
                  itemBuilder: (context, index) {
                    return PlanItem(index: index);
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<PlanProvider>(context, listen: false).addPlan("Rencana Baru");
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah"),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

class PlanItem extends StatelessWidget {
  final int index;

  const PlanItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanProvider>(
      builder: (context, planProvider, child) {
        final plan = planProvider.plans[index];

        return Card(
          elevation: 6,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Checkbox(
              value: plan.isCompleted,
              onChanged: (value) {
                planProvider.toggleComplete(index);
              },
              activeColor: Colors.green,
            ),
            title: Text(
              plan.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: plan.isCompleted ? TextDecoration.lineThrough : null,
                color: plan.isCompleted ? Colors.grey : Colors.black,
              ),
            ),
            trailing: Wrap(
              spacing: 8,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blueAccent),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => EditPlanBottomSheet(index: index, currentName: plan.name),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () {
                    planProvider.removePlan(index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EditPlanBottomSheet extends StatelessWidget {
  final int index;
  final String currentName;

  const EditPlanBottomSheet({super.key, required this.index, required this.currentName});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: currentName);
    final planProvider = Provider.of<PlanProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Edit Rencana",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Masukkan rencana baru",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Batal", style: TextStyle(color: Colors.red)),
              ),
              ElevatedButton(
                onPressed: () {
                  planProvider.updatePlan(index, controller.text);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text("Simpan"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
