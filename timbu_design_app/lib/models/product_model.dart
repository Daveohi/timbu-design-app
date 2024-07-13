import 'package:flutter/material.dart';

import '../cart_list.dart/product_list.dart';

class ProductModel extends ChangeNotifier {
  final List<Product> _products = [
    Product(
        name: "GERMANY 24 AWAY",
        images: "assets/pink.png",
        price: 500000,
        rating: 5.0,
        // size: 'M',
        quantity: 1),
    Product(
        name: "MANCHESTER UNITED 24 HOME",
        price: 240000,
        rating: 3.5,
        images: 'assets/whitepink.png',
        // size: 'M',
        quantity: 1),
    Product(
        name: "ITALY 24 HOME",
        price: 450000,
        rating: 4.5,
        images: 'assets/realmadrid.png',
        // size: 'M',
        quantity: 1),
    Product(
        name: "MANCHESTER UNITED 24 HOME",
        price: 240000,
        rating: 3.5,
        images: 'assets/red.png',
        // size: 'M',
        quantity: 1),
    Product(
        name: "SPAIN 24 AWAY JERSEY",
        price: 87000,
        rating: 4.5,
        images: 'assets/cream.png',
        // size: 'M',
        quantity: 1),
    Product(
        name: "MERCY TRAINING JERSEY",
        price: 450000,
        rating: 4.5,
        images: 'assets/argentina.png',
        // size: 'M',
        quantity: 1),
    Product(
        name: "FC BAYERN 24/25 HOME",
        price: 100000,
        rating: 4.5,
        images: 'assets/red-t.png',
        // size: 'M',
        quantity: 1),
    Product(
        name: "MANCHESTER UNITED",
        price: 311000,
        rating: 4.5,
        images: 'assets/tezos-red.png',
        // size: 'M',
        quantity: 1),
        Product(
        name: "MANCHESTER UNITED",
        price: 88000,
        rating: 4.5,
        images: 'assets/tezos.png',
        // size: 'M',
        quantity: 1),
        Product(
        name: "ARSENAL JERSEY",
        price: 70000,
        rating: 4.5,
        images: 'assets/arsenal.png',
        // size: 'M',
        quantity: 1),
  ];

  List<Product> get products => _products;

  final List<CartItem> items = [];

  List<CartItem> get _items => items;

  int get itemCount => items.length;

  int get itemsTotal => items.length;

  double get delivery => 5000;

  double get services => 3500;

  double get itemsSubTotal => _items.fold(
      0, (total, item) => total + item.product.price * item.quantity);

  void addItem(Product product) {
    var existingItem = _items.firstWhere(
      (item) => item.product == product,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (_items.contains(existingItem)) {
      existingItem.quantity++;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
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
