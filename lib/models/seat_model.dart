class SeatModel {
  final String? seatId;
  final String? trainCode;
  final String? carNum;
  final String? seatNum;
  final DateTime? createdAt;

  SeatModel({
    this.seatId,
    this.trainCode,
    this.carNum,
    this.seatNum,
    this.createdAt,
  });

  factory SeatModel.fromJson(Map<String, dynamic> json) {
    return SeatModel(
      seatId: json['seatId'] == null ? null : json['seatId'] as String,
      trainCode: json['trainCode'] == null ? null : json['trainCode'] as String,
      carNum: json['carNum'] == null ? null : json['carNum'] as String,
      seatNum: json['seatNum'] == null ? null : json['seatNum'] as String,
      createdAt: json['createdAt'] == null ? null : json["createdAt"].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'seatId': seatId,
      'trainCode': trainCode,
      'carNum': carNum,
      'seatNum': seatNum,
      'createdAt': createdAt,
    };
  }

  SeatModel copyWith({
    String? seatId,
    String? trainCode,
    String? carNum,
    String? seatNum,
    DateTime? createdAt,
  }) {
    return SeatModel(
      seatId: seatId ?? this.seatId,
      trainCode: trainCode ?? this.trainCode,
      carNum: carNum ?? this.carNum,
      seatNum: seatNum ?? this.seatNum,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
