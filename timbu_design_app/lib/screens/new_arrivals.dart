import 'package:flutter/material.dart';

class HeroImageContainer extends StatelessWidget {
  const HeroImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 138,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFEAEEEF)),
          child: Stack(
            children: [
              Positioned(
                left: 56.85,
                top: -87,
                child: Container(
                  width: 301.25,
                  height: 338.14,
                  decoration:  const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('item.image'),
                          
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -6,
                top: -28.94,
                child: Container(
                  width: 105.20,
                  height: 262.31,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('item.image'),
                          
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 41.82,
                top: -60.36,
                child: Container(
                  width: 166,
                  height: 396.20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('item.image'),
                          
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 27,
                child: Container(
                  width: 360,
                  height: 84,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -1.00),
                      end: const Alignment(0, 1),
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white,
                        Colors.white.withOpacity(0)
                      ],
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            '2024/2025 JERSEY ARRIVAL',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF02601E),
                              fontSize: 26,
                              fontFamily: 'Rockwell Condensed',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
