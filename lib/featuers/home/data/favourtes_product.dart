class FavourtesProduct {
  DateTime? createdAt;
  String? forUserid;
  String? favouriteId;
  bool? isFavourite;
  String? forProductid;

  FavourtesProduct({
    this.createdAt,
    this.forUserid,
    this.favouriteId,
    this.isFavourite,
    this.forProductid,
  });

  factory FavourtesProduct.fromJson(Map<String, dynamic> json) {
    return FavourtesProduct(
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      forUserid: json['for_userid'] as String?,
      favouriteId: json['favourite_id'] as String?,
      isFavourite: json['is_favourite'] as bool?,
      forProductid: json['for_productid'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'created_at': createdAt?.toIso8601String(),
        'for_userid': forUserid,
        'favourite_id': favouriteId,
        'is_favourite': isFavourite,
        'for_productid': forProductid,
      };
}
