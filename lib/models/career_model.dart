import 'package:cloud_firestore/cloud_firestore.dart';

class Career {
  String companyName;
  String jobTitle;
  String skills;
  Timestamp startDate;
  Timestamp endDate;

  Career(
      {required this.companyName,
      required this.jobTitle,
      required this.skills,
      required this.startDate,
      required this.endDate});

  Career.fromJson(Map<String, Object?> json)
      : this(
          companyName: json['companyName']! as String,
          jobTitle: json['jobTitle']! as String,
          skills: json['skills']! as String,
          startDate: json['startDate']! as Timestamp,
          endDate: json['endDate']! as Timestamp,
        );

  Career copyWith({
    String? companyName,
    String? jobTitle,
    String? skills,
    Timestamp? startDate,
    Timestamp? endDate,
  }) {
    return Career(
      companyName: companyName ?? this.companyName,
      jobTitle: jobTitle ?? this.jobTitle,
      skills: skills ?? this.skills,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'companyName': companyName,
      'jobTitle': jobTitle,
      'skills': skills,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
