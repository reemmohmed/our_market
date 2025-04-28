import 'favourtes_product.dart';
import 'pruches_table.dart';

class ProductModel {
  String? productId;
  DateTime? createdAt;
  String? productName;
  String? productDescraption;
  String? price;
  String? oldPrice;
  String? sale;
  String? catogery;
  String? imageUrl;
  List<FavourtesProduct>? favourtesProduct;
  List<PruchesTable>? pruchesTable;

  ProductModel({
    this.productId,
    this.createdAt,
    this.productName,
    this.productDescraption,
    this.price,
    this.oldPrice,
    this.sale,
    this.catogery,
    this.imageUrl,
    this.favourtesProduct,
    this.pruchesTable,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json['product_id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        productName: json['product_name'] as String?,
        productDescraption: json['product_descraption'] as String?,
        price: json['price'] as String?,
        oldPrice: json['old_price'] as String?,
        sale: json['sale'] as String?,
        catogery: json['catogery'] as String?,
        imageUrl: json['image_url'] as String?,
        favourtesProduct: (json['favourtes_product'] as List<dynamic>?)
            ?.map((e) => FavourtesProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        pruchesTable: (json['pruches_table'] as List<dynamic>?)
            ?.map((e) => PruchesTable.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'created_at': createdAt?.toIso8601String(),
        'product_name': productName,
        'product_descraption': productDescraption,
        'price': price,
        'old_price': oldPrice,
        'sale': sale,
        'catogery': catogery,
        'image_url': imageUrl,
        'favourtes_product': favourtesProduct?.map((e) => e.toJson()).toList(),
        'pruches_table': pruchesTable?.map((e) => e.toJson()).toList(),
      };
}
