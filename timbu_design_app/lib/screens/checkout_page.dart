// import 'package:flutter/material.dart';
// import 'package:timbu_design_app/screens/coupon_code_section.dart';
// // import '../cart_list.dart/cart_list.dart';
// import '../cart_list.dart/product_list.dart';
// // import '../models/cart_item.dart';
// import 'customer_info_form.dart';
// import 'make_payment.dart';
// import 'order_summary.dart';

// class CheckoutPage extends StatefulWidget {
//   const CheckoutPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CheckoutPageState createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   String deliveryOption = 'Delivery';
//   bool isDelivery = true;

//   @override
//   Widget build(BuildContext context) {

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
//           'Checkout',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Items',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 8),
//                   ....map((item) => CartItemWidget(item: item)),
//                   const SizedBox(height: 16),
//                   const Text('Delivery Options',
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold)),

//                   const SizedBox(height: 16),
//                   ToggleButtons(

//                     isSelected: [isDelivery, !isDelivery],
//                     onPressed: (index) {
//                       setState(() {
//                         isDelivery = index == 0;
//                       });
//                     },
//                     children: const [
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 72),

//                         child: Text(
//                           'Delivery',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 60),
//                         child: Text(
//                           'Pickup',
//                           style: TextStyle(color: Colors.black45),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 16),
//                   const CustomerInfoForm(),
//                   const SizedBox(height: 32),
//                   const Text(
//                     'Order Summary',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                   const SizedBox(height: 16),
//                   const OrderSummaryItem(title: 'Items', value: '4'),
//                   const OrderSummaryItem(title: 'Delivery', value: '₦5,000'),
//                   const OrderSummaryItem(title: 'Services', value: '₦3,500'),
//                   const SizedBox(height: 32),
//                   const CouponCodeSection(),
//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           ),
//           const MakePayment(),
//         ],
//       ),
//     );
//   }
// }

// class CartItemWidget extends StatelessWidget {
//   final Product item;

//   const CartItemWidget({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(item.images),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(item.name,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.black)),
//                 Text(
//                   '₦${item.price}',
//                   style: const TextStyle(color: Color(0xFF067928)),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(item.size),
//               const Text('x1'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_list.dart/product_list.dart';
import '../models/product_model.dart';
import 'coupon_code_section.dart';
import 'customer_info_form.dart';
import 'make_payment.dart';
import 'order_summary.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isDelivery = true;

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
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Items',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...cart.items.map((cartItem) => CartItemWidget(
                        item: cartItem.product,
                        quantity: cartItem.quantity,
                      )),
                  const SizedBox(height: 16),
                  const Text('Delivery Options',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ToggleButtons(
                    isSelected: [isDelivery, !isDelivery],
                    onPressed: (index) {
                      setState(() {
                        isDelivery = index == 0;
                      });
                    },
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 72),
                        child: Text(
                          'Delivery',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        child: Text(
                          'Pickup',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const CustomerInfoForm(),
                  const SizedBox(height: 32),
                  const Text(
                    'Order Summary',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  OrderSummaryItem(
                      title: 'Items', value: '₦${cart.itemsSubTotal}'),
                  OrderSummaryItem(
                      title: 'Delivery', value: '₦${cart.delivery}'),
                  OrderSummaryItem(
                      title: 'Services', value: '₦${cart.services}'),
                  const SizedBox(height: 32),
                  const CouponCodeSection(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          const MakePayment(),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final Product item;
  final int quantity;

  const CartItemWidget({super.key, required this.item, required this.quantity});

  // get quantity => item;

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<ProductModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.images),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                Text(
                  '₦${item.price}',
                  style: const TextStyle(color: Color(0xFF067928)),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.size),
              Text('x$quantity'),
              // Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(item.size),
//               const Text('x1'),
//             ],
//           ),
              // Row(
              //   children: [
              //     IconButton(
              //       icon: const Icon(Icons.remove_circle),
              //       onPressed: () {
              //         cart.decreaseQuantity(item);
              //       },
              //     ),
              //     Text('$quantity'),
              //     IconButton(
              //       icon: const Icon(Icons.add_circle),
              //       onPressed: () {
              //         cart.increaseQuantity(item);
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
