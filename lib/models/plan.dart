import 'task.dart';

class Plan {
  String _name; // Gunakan private variable agar lebih aman
  final List<Task> tasks; // Jika ada daftar tugas

  Plan({required String name, List<Task>? tasks})
      : _name = name,
        tasks = tasks ?? [];

  // Getter untuk name
  String get name => _name;

  // Setter agar bisa diperbarui
  set name(String newName) {
    _name = newName;
  }

  // Gunakan copyWith untuk update yang lebih aman
  Plan copyWith({String? name, List<Task>? tasks}) {
    return Plan(
      name: name ?? _name,
      tasks: tasks ?? this.tasks,
    );
  }
}
  