import 'package:hive/hive.dart';

part 'employee.model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel {
  EmployeeModel({
    required this.name,
    required this.position,
    required this.dateOfJoining,
    required this.dateOfLeaving,
  });

  EmployeeModel copyWith({
    String? name,
    String? position,
    DateTime? dateOfJoining,
    DateTime? dateOfLeaving,
  }) {
    return EmployeeModel(
      name: name ?? this.name,
      position: position ?? this.position,
      dateOfJoining: dateOfJoining ?? this.dateOfJoining,
      dateOfLeaving: dateOfLeaving ?? this.dateOfLeaving,
    );
  }

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String position;
  @HiveField(2)
  final DateTime dateOfJoining;
  @HiveField(3)
  final DateTime? dateOfLeaving;
}
