// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterProblems {
  String status;
  List<String> conflictProperties;

  RegisterProblems({
    required this.status,
    required this.conflictProperties,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'conflictProperties': conflictProperties,
    };
  }

  factory RegisterProblems.fromMap(Map<String, dynamic> map) {
    return RegisterProblems(
        status: map['status'] as String,
        conflictProperties: List<String>.from(
          (map['conflictProperties'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory RegisterProblems.fromJson(String source) =>
      RegisterProblems.fromMap(json.decode(source) as Map<String, dynamic>);
}
