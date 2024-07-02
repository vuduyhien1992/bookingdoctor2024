import 'package:mobile/models/patient.dart';
import 'dart:core';
class Feedbacks{
  late final int id;
  late final int patientId;
  late final double rate;
  late final String comment;
  late final bool status;
  late final Patient patient;
  Feedbacks({
    required this.id,
    required this.patientId,
    required this.rate,
    required this.comment,
    required this.status,
    required this.patient,
  });
  factory Feedbacks.fromJson(Map<String, dynamic> json){
    return Feedbacks(
      id: json['id'] ?? 0,
      patientId: json['patientId'] ?? 0,
      rate: json['rate'] ?? 0.0,
      comment: json['comment'] ?? '',
      status: json['status'] ?? false,
      patient: Patient.fromJson(json['patient'] ?? {}),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'patientId': patientId,
      'rate': rate,
      'comment': comment,
     'status': status,
      'patient': patient.toJson(),
    };
  }
}