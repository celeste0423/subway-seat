class EmailModel {
  final String? email;
  final DateTime? createdAt;

  EmailModel({
    this.email,
    this.createdAt,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      email: json['email'] == null ? null : json['email'] as String,
      createdAt: json['createdAt'] == null ? null : json["createdAt"].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'createdAt': createdAt,
    };
  }

  EmailModel copyWith({
    String? email,
    DateTime? createdAt,
  }) {
    return EmailModel(
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
