import 'package:flutter/material.dart';

class MakePayment extends StatelessWidget {
  const MakePayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sub Total',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 14),
                ),
                const SizedBox(height: 4),
                const Text(
                  '₦780,000',
                  style: TextStyle(
                      color: Color(0xFF067928),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF067928),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
              child: const Text('Make Payment',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
