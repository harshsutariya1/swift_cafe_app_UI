import 'package:flutter/material.dart';
import 'package:seequenze_app/beverage_detail_screen.dart';
import 'package:seequenze_app/constants.dart';

Widget beverageCardH(BuildContext context, String name, String image) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BeverageDetailScreen(
            beverageName: name,
            beverageImagePath: image,
          ),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 10,
        left: 20,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(84, 180, 180, 180),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
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
                    const SizedBox(width: 10),
                    Image.asset(
                      vegIconPath,
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  coffeeDescription,
                  style: const TextStyle(
                    color: Colors.white70,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 100,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 25,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "ADD",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
