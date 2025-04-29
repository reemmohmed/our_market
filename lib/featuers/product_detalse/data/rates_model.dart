class RatesModel {
  String? id;
  DateTime? createdAt;
  String? forUser;
  String? forProduct;
  int? rate;

  RatesModel({
    this.id,
    this.createdAt,
    this.forUser,
    this.forProduct,
    this.rate,
  });

  factory RatesModel.fromJson(Map<String, dynamic> json) => RatesModel(
        id: json['id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        forUser: json['for_user'] as String?,
        forProduct: json['for_product'] as String?,
        rate: json['rate'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'for_user': forUser,
        'for_product': forProduct,
        'rate': rate,
      };
}
