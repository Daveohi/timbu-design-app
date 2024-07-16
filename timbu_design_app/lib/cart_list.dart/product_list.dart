class Product {
  final String name;
  final String images;
  final int price;
  final double rating;
  final String size;
  final int quantity;
  final int index;

  Product(
      {required this.name,
      required this.price,
      required this.rating,
      required this.images,
       required this.size,
      required this.quantity,
      required this.index,
    });
}

// class CartItem {
//   final String image;
//   final String name;
//   final int price;
//   final String size;
//   late int quantity;

//   CartItem({
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.size,
//     required this.quantity,
//   });
// }
