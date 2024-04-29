class ContactInfo {
  String email;
  String mobileNumber;
  String name;

  ContactInfo({
    required this.email,
    required this.mobileNumber,
    required this.name,
  });

  ContactInfo.fromJson(Map<String, Object?> json)
      : this(
          email: json['email']! as String,
          mobileNumber: json['mobileNumber']! as String,
          name: json['name']! as String,
        );

  ContactInfo copyWith({
    String? email,
    String? mobileNumber,
    String? name,
  }) {
    return ContactInfo(
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        name: name ?? this.name);
  }

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'mobile_no': mobileNumber,
      'name': name,
    };
  }
}
