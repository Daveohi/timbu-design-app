// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:timbu_design_app/cart_list.dart/cart_list.dart';
// import 'package:timbu_design_app/models/product_model.dart';
// // import '../models/cart_item.dart';
// import 'checkout_button.dart';
// import 'coupon_code_section.dart';
// import 'order_summary2.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<ProductModel>(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.chevron_left),
//           color: Colors.black,
//           iconSize: 40,
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Cart',
//           style: TextStyle(color: Colors.black),
//         ),
//         actions: [
//           Center(
//               child: Text('${cart.itemCount} Items',
//                   style: const TextStyle(fontSize: 16, color: Colors.black))),
//           const SizedBox(width: 16),
//         ],
//       ),
//       body: Stack(
//         children: [
//           ListView(
//             children: [
//               ...cart.items.map((item) => CartItemCard(
//                     item: item,
//                   )),

//               OrderSummary2(cartItems: cartItems),
//               const CouponCodeSection(),
//               const SizedBox(height: 80), // Add space for the fixed bottom bar
//             ],
//           ),
//           const Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: CheckoutButton(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CartItemCard extends StatelessWidget {
//   // final List<ProductModel> cartItems;
//   // final Function(int index, int newQuantity) onUpdateQuantity;
//   // final Function(int index) onDeleteItem;
//   final ProductModel item;

//   const CartItemCard(
//       {super.key,
//       // required this.cartItems,
//       // required this.onUpdateQuantity,
//       // required this.onDeleteItem,
//       required this.item,
//        });

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<ProductModel>(context);
//         return Container(
//           width: double.infinity,
//           height: 200,
//           decoration: const BoxDecoration(color: Colors.white),
//           margin: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 120,
//                       height: 140,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                         image: DecorationImage(
//                           image: AssetImage(item.),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             item.product.name,
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: [
//                               const Text(
//                                 '₦',
//                                 style: TextStyle(
//                                   color: Color(0xFF067928),
//                                   fontSize: 16,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               const SizedBox(width: 2),
//                               Text(
//                                 item.price.toString(),
//                                 style: const TextStyle(
//                                   color: Color(0xFF067928),
//                                   fontSize: 16,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Quantity: \n${item.size}',
//                                 style: TextStyle(
//                                   color: Colors.black.withOpacity(0.8),
//                                   fontSize: 14,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(Icons.remove_circle),
//                                     onPressed:
//                                       item.quantity > 1
//                                     ? () {
//                                         cart.decreaseQuantity(item.product);
//                                       }
//                                     : null,

//                                   ),
//                                   Text('${item.quantity}'),
//                                   IconButton(
//                                     icon: const Icon(Icons.add_circle),
//                                     onPressed: () {
//                                       cart.increaseQuantity(item.product);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           GestureDetector(
//                             onTap: () {
//                           cart.removeItem(item.product);
//                         },
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon:
//                                       const Icon(Icons.delete, color: Colors.red),
//                                   onPressed: () => onDeleteItem(index),
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Text(
//                                   'Remove',
//                                   style: TextStyle(
//                                     color: Colors.black.withOpacity(0.4),
//                                     fontSize: 12,
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu_design_app/models/product_model.dart';
// import 'package:timbu_design_app/cart_list.dart/cart_list.dart';
import 'package:timbu_design_app/screens/order_summary2.dart';
import 'checkout_button.dart';
import 'coupon_code_section.dart';
// import '../models/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProductModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          color: Colors.black,
          iconSize: 40,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Center(
              child: Text('${cart.itemCount} Items',
                  style: const TextStyle(fontSize: 16, color: Colors.black))),
          const SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              ...cart.items.map((item) => CartItemCard(
                    item: item,
                  )),
              const OrderSummary2(
                cartItems: [],
              ),
              const CouponCodeSection(),
              const SizedBox(height: 80), // Add space for the fixed bottom bar
            ],
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CheckoutButton(),
          ),
        ],
      ),
    );
  }
}

// Update CartItemCard to Reflect Cart Items with functionalities
class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProductModel>(context, listen: false);

    return Container(
      width: double.infinity,
      height: 180,
      decoration: const BoxDecoration(color: Colors.white),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 120,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: AssetImage(item.product.images),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.product.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            '₦',
                            style: TextStyle(
                              color: Color(0xFF067928),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            item.product.price.toString(),
                            style: const TextStyle(
                              color: Color(0xFF067928),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity: \nM',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: item.quantity > 1
                                    ? () {
                                        cart.decreaseQuantity(item.product);
                                      }
                                    : null,
                              ),
                              Text('${item.quantity}'),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  cart.increaseQuantity(item.product);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          cart.removeItem(item.product);
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.delete, color: Colors.red),
                            const SizedBox(width: 4),
                            Text(
                              'Remove',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
