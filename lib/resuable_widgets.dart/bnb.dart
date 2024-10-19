import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:seequenze_app/constants.dart';

Widget bottomNavigation(BuildContext context, Size size) {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 25,
    ),
    height: 60.0,
    width: double.infinity,
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 51, 51, 51).withOpacity(.84),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 51, 51, 51).withOpacity(.84),
        )),
    constraints: const BoxConstraints(
      maxWidth: 600,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            bnbIcon(homeIconPath, isSelected: true),
            bnbIcon(personIconPath),
            bnbIcon(walletIconPath),
            bnbIcon(cartIconPath),
            bnbIcon(massagesIconPath),
          ],
        ),
      ),
    ),
  );
}

bnbIcon(String name, {bool isSelected = false}) {
  return isSelected
      ? CircleAvatar(
          radius: 21,
          backgroundColor: Colors.black.withOpacity(.35),
          child: bnbIcon(name),
        )
      : ImageIcon(
          size: 20,
          AssetImage(
            name,
          ),
          color: Colors.white,
        );
}
