import 'package:hive_flutter/adapters.dart';
part 'teacher_model.g.dart';

@HiveType(typeId: 1)
class TeacherModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String branch;
  @HiveField(2)
  String email;

  TeacherModel({
    required this.name,
    required this.branch,
    required this.email,
  });

  factory TeacherModel.fromMap(Map<String, dynamic> data) {
    return TeacherModel(
      name: data['name'] ?? '',
      branch: data['branch'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'branch': branch,
      'email': email,
    };
  }
}
