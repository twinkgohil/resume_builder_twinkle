import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  String universityName;
  String qualification;
  Timestamp startDate;
  Timestamp endDate;

  Education(
      {required this.universityName,
      required this.qualification,
      required this.startDate,
      required this.endDate});

  Education.fromJson(Map<String, Object?> json)
      : this(
          universityName: json['universityName']! as String,
          qualification: json['qualification']! as String,
          startDate: json['startDate']! as Timestamp,
          endDate: json['endDate']! as Timestamp,
        );

  Education copyWith({
    String? universityName,
    String? qualification,
    Timestamp? startDate,
    Timestamp? endDate,
  }) {
    return Education(
      universityName: universityName ?? this.universityName,
      qualification: qualification ?? this.qualification,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'universityName': universityName,
      'qualification': qualification,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
