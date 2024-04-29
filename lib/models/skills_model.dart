class Skills {
  String skills;

  Skills({
    required this.skills,
  });

  Skills.fromJson(Map<String, Object?> json)
      : this(
          skills: json['skills']! as String,
        );

  Skills copyWith({
    String? skills,
  }) {
    return Skills(skills: skills ?? this.skills);
  }

  Map<String, Object?> toJson() {
    return {
      'skills': skills,
    };
  }
}
