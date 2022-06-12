class Product {
  String productID;
  List imgList;
  String productName;
  double productPrice;
  String productDescription;
  double productRating;
  List productReviews;
  String productImageUrl;

  Product(
      {required this.productID,
        required this.productPrice,
      required this.productName,
      required this.productReviews,
      required this.imgList,
      required this.productDescription,
      required this.productImageUrl,
      required this.productRating});
}
