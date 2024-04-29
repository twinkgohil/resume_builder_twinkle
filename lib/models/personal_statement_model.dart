class PersonalStatement {
  String statement;

  PersonalStatement({
    required this.statement,
  });

  PersonalStatement.fromJson(Map<String, Object?> json)
      : this(
          statement: json['statement']! as String,
        );

  PersonalStatement copyWith({
    String? statement,
  }) {
    return PersonalStatement(statement: statement ?? this.statement);
  }

  Map<String, Object?> toJson() {
    return {
      'statement': statement,
    };
  }
}
