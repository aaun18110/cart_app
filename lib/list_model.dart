// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  final String? productId;
  final String? productName;
  final String? productPrice;
  final String? unitTag;
  final String? image;
  CartModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.unitTag,
    required this.image,
  });

  CartModel.fromMap(Map<dynamic, dynamic> res)
      : productId = res['productId'],
        productName = res['productName'],       
        productPrice = res['productPrice'],
        unitTag = res['unitTag'],
        image = res['image'];

  Map<String, Object?> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
      'unitTag': unitTag,
      'image': image
    };
  }
}
