import 'task.dart';

class Plan {
  String _name; // Gunakan private variable agar lebih aman
  final List<Task> tasks; // Jika ada daftar tugas
  bool _isCompleted; // Tambahkan properti ceklis

  Plan({
    required String name,
    List<Task>? tasks,
    bool isCompleted = false, // Default tidak dicentang
  })  : _name = name,
        tasks = tasks ?? [],
        _isCompleted = isCompleted;

  // Getter untuk name
  String get name => _name;

  // Setter agar bisa diperbarui
  set name(String newName) {
    _name = newName;
  }

  // Getter dan Setter untuk isCompleted
  bool get isCompleted => _isCompleted;

  set isCompleted(bool value) {
    _isCompleted = value;
  }

  // Gunakan copyWith untuk update yang lebih aman
  Plan copyWith({String? name, List<Task>? tasks, bool? isCompleted}) {
    return Plan(
      name: name ?? _name,
      tasks: tasks ?? this.tasks,
      isCompleted: isCompleted ?? _isCompleted, // Perbarui isCompleted jika ada perubahan
    );
  }
}
