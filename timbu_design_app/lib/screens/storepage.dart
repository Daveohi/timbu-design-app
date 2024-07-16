import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:timbu_design_app/screens/cart_page.dart';
import 'package:timbu_design_app/screens/new_arrivals.dart';
import '../cart_list.dart/product_list.dart';
import '../models/product_model.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProductModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for anything',
            suffixIcon: const Icon(Icons.search),
            suffixIconColor: Colors.black45,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black54),
              onPressed: () {}),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/cart-icon.png',
                  width: 44,
                  height: 44,
                ),
                // icon: const Icon(Icons.shopping_cart, color: Colors.green),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
              ),
              if (cart.itemCount >= 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${cart.itemCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              if (cart.itemCount == 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                  ),
                ),
            ],
          ),
        ],
        toolbarHeight: 120,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                'assets/hero-image.png'), // Replace with your banner image
            const ProductSection(
              title: 'New Arrivals',
            ),
            const ProductSection(title: 'Top Sellers'),
            const ProductSection(title: 'More of what you like'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/store.png',
              width: 24,
              height: 24,
            ),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/liked.png',
              width: 24,
              height: 24,
            ),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/orders.png',
              width: 24,
              height: 24,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/account.png',
              width: 24,
              height: 24,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class ProductSection extends StatelessWidget {
  final String title;
  // final int index;

  const ProductSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewArrivals(title: ''),
                      ),
                    );
                  },
                  child: const Text(
                    'See more',
                    style: TextStyle(color: Color(0xFF067928)),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productModel.products.length,
            // itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCard(product: productModel.products[index]);
            },
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // itemCount: productModel.products.length,
            itemCount: 4,
            addRepaintBoundaries: true,
            itemBuilder: (context, index) {
              return ProductCard(product: productModel.products[index]);
            },
          ),
        ),
        SizedBox(
          height: 1100,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
            ),
            itemCount: productModel.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: productModel.products[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProductModel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        cart.addItem(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.name} added to cart'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(product.images),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text('N${product.price}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF067928))),
            Text(
              style: const TextStyle(color: Colors.black),
              product.name,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  product.rating.toString(),
                  style: const TextStyle(color: Colors.black45),
                ),
                const Icon(Icons.star, size: 16, color: Colors.amber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
