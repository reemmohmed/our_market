class PruchesTable {
  String? id;
  String? forUser;
  bool? isBought;
  DateTime? createdAt;
  String? forProduct;

  PruchesTable({
    this.id,
    this.forUser,
    this.isBought,
    this.createdAt,
    this.forProduct,
  });

  factory PruchesTable.fromJson(Map<String, dynamic> json) => PruchesTable(
        id: json['id'] as String?,
        forUser: json['for_user'] as String?,
        isBought: json['is_bought'] as bool?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        forProduct: json['for_product'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'for_user': forUser,
        'is_bought': isBought,
        'created_at': createdAt?.toIso8601String(),
        'for_product': forProduct,
      };
}
