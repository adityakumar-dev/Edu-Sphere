import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String rollNumber;
  @HiveField(2)
  String branch;
  @HiveField(3)
  String semester;
  @HiveField(4)
  String email;

  StudentModel({
    required this.name,
    required this.rollNumber,
    required this.branch,
    required this.semester,
    required this.email,
  });

  factory StudentModel.fromMap(Map<String, dynamic> data) {
    return StudentModel(
      name: data['name'] ?? '',
      rollNumber: data['rollNumber'] ?? '',
      branch: data['branch'] ?? '',
      semester: data['semester'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rollNumber': rollNumber,
      'branch': branch,
      'semester': semester,
      'email': email,
    };
  }
}
