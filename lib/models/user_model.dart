class UserModel {
  final String? uid;
  final String? email;
  final int? stamp;
  final DateTime? createdAt;

  UserModel({
    this.uid,
    this.email,
    this.stamp,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] == null ? null : json['uid'] as String,
      email: json['email'] == null ? null : json['email'] as String,
      stamp: json['stamp'] == null ? null : json['stamp'] as int,
      createdAt: json['createdAt'] == null ? null : json["createdAt"].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'stamp': stamp,
      'createdAt': createdAt,
    };
  }

  UserModel copyWith({
    String? uid,
    String? email,
    int? stamp,
    DateTime? createdAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      stamp: stamp ?? this.stamp,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
