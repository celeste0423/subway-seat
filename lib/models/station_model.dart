class StationModel {
  final String? name;
  final int? index;

  StationModel({
    this.name,
    this.index,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      name: json['name'] == null ? null : json['name'] as String,
      index: json['index'] == null ? null : json['index'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'index': index,
    };
  }

  StationModel copyWith({
    String? name,
    int? index,
  }) {
    return StationModel(
      name: name ?? this.name,
      index: index ?? this.index,
    );
  }
}
