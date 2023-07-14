class TransactionTypeModel {
  final int? id;
  final String? name;
  final String? code;
  final String? action;
  final String? thumbnail;
  final String? status;
  final String? time;

  TransactionTypeModel(
      {this.id,
      this.name,
      this.code,
      this.action,
      this.thumbnail,
      this.status,
      this.time});

  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) =>
      TransactionTypeModel(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        action: json['action'],
        thumbnail: json['thumbnail'],
        status: json['status'],
        time: json['time'],
      );
}
