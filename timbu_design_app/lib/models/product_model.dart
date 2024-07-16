import 'package:flutter/material.dart';
import '../cart_list.dart/product_list.dart';

class ProductModel extends ChangeNotifier {
  final List<Product> _products = [
    Product(
        name: "GERMANY 24 AWAY",
        images: "assets/pink.png",
        price: 500000,
        rating: 5.0,
        quantity: 1,
        size: 'M',
        index: 1),
    Product(
        name: "MANCHESTER UNITED 24 HOME",
        price: 240000,
        rating: 3.5,
        images: 'assets/whitepink.png',
        quantity: 1,
        size: 'M',
        index: 2),
    Product(
        name: "ITALY 24 HOME",
        price: 450000,
        rating: 4.5,
        images: 'assets/realmadrid.png',
        quantity: 1,
        size: 'M',
        index: 3),
    Product(
        name: "MANCHESTER UNITED 24 HOME",
        price: 240000,
        rating: 3.5,
        images: 'assets/red.png',
        quantity: 1,
        size: 'M',
        index: 4),
    Product(
        name: "SPAIN 24 AWAY JERSEY",
        price: 87000,
        rating: 4.5,
        images: 'assets/cream.png',
        quantity: 1,
        size: 'M',
        index: 5),
    Product(
        name: "MERCY TRAINING JERSEY",
        price: 450000,
        rating: 4.5,
        images: 'assets/argentina.png',
        quantity: 1,
        size: 'M',
        index: 6),
    Product(
        name: "FC BAYERN 24/25 HOME",
        price: 100000,
        rating: 4.5,
        images: 'assets/red-t.png',
        quantity: 1,
        size: 'M',
        index: 7),
    Product(
        name: "MANCHESTER UNITED",
        price: 311000,
        rating: 4.5,
        images: 'assets/tezos-red.png',
        quantity: 1,
        size: 'M',
        index: 8),
    Product(
        name: "MANCHESTER UNITED",
        price: 88000,
        rating: 4.5,
        images: 'assets/tezos.png',
        quantity: 1,
        size: 'M',
        index: 9),
    Product(
        name: "ARSENAL JERSEY",
        price: 70000,
        rating: 4.5,
        images: 'assets/arsenal.png',
        quantity: 1,
        size: 'M',
        index: 10),
    Product(
      images: 'assets/germany.png',
      name: 'GERMANY 24 AWAY JERSEY',
      price: 500000,
      quantity: 1,
      size: 'M',
      rating: 4.5,
      index: 11,
    ),
    Product(
        images: 'assets/realmadrid.png',
        name: 'REAL MADRID PRE-MATCH',
        price: 780000,
        quantity: 1,
        size: 'M',
        rating: 4.5,
        index: 12),
    Product(
      images: 'assets/t.png',
      name: 'FC BATERN 23/24 AWAY JE...',
      price: 130000,
      quantity: 1,
      size: 'M',
      rating: 4.5,
      index: 13,
    ),
    Product(
        images: 'assets/jeep.png',
        name: 'JUVENTUS 23/24 HOME JE...',
        price: 230000,
        quantity: 1,
        size: 'M',
        rating: 4.5,
        index: 14),
  ];

  List<Product> get products => _products;

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get delivery => 5000;

  double get services => 3500;

  double get itemsSubTotal => _items.fold(
      0, (total, item) => total + item.product.price * item.quantity);

  void addItem(Product product) {
    var existingItem = _items.firstWhere(
      (item) => item.product == product,
      orElse: () => CartItem(product: product),
    );

    if (_items.contains(existingItem)) {
      increaseQuantity(existingItem.product);
    } else {
      _items.add(CartItem(product: product));
    }

    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((item) => item.product == product);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    var existingItem = _items.firstWhere((item) => item.product == product);
    existingItem.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    var existingItem = _items.firstWhere((item) => item.product == product);
    if (existingItem.quantity > 1) {
      existingItem.quantity--;
    }
    notifyListeners();
  }

  void updateItemQuantity(CartItem item, int quantity) {
    item.quantity = quantity;
    notifyListeners();
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
