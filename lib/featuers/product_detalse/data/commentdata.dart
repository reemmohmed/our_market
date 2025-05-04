class Commentdata {
  String? id;
  DateTime? createdAt;
  String? comment;
  String? forUser;
  String? forProduct;
  String? userName;
  dynamic replay;

  Commentdata({
    this.id,
    this.createdAt,
    this.comment,
    this.forUser,
    this.forProduct,
    this.userName,
    this.replay,
  });

  factory Commentdata.fromJson(Map<String, dynamic> json) => Commentdata(
        id: json['id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        comment: json['comment'] as String?,
        forUser: json['for_user'] as String?,
        forProduct: json['for_product'] as String?,
        userName: json['user_name'] as String?,
        replay: json['replay'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'comment': comment,
        'for_user': forUser,
        'for_product': forProduct,
        'user_name': userName,
        'replay': replay,
      };
}
