import 'package:flutter/material.dart';
import 'package:seequenze_app/constants.dart';

Widget bevrageCardV(BuildContext context, String image, void Function() ontap) {
  return InkWell(
    onTap: ontap,
    child: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      width: 220,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(120, 255, 255, 255),
            Color.fromARGB(167, 255, 255, 255),
          ],
        ),
        color: Colors.white.withOpacity(0.4),
        border: Border.all(color: Colors.white54),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                image,
                width: 120,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "HotCappuccino",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Espresso, Steamed Milk",
                      style: TextStyle(fontSize: 12),
                    ),
                    Row(
                      children: [
                        const Text("4.5"),
                        const SizedBox(width: 5),
                        Image.asset(
                          starIconPath,
                          width: 15,
                        ),
                        const SizedBox(width: 7),
                        const Text("(458)"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
