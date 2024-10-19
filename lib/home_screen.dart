import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:seequenze_app/constants.dart';
import 'package:seequenze_app/resuable_widgets.dart/bnb.dart';
import 'package:seequenze_app/resuable_widgets.dart/horizontal_card.dart';
import 'package:seequenze_app/resuable_widgets.dart/vertical_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
    );
  }
}

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: Container(
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        handIconPath,
      ),
    ),
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "20/12/2022",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        Text(
          "Joshua Scannlan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
    actions: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          cartIconWithBackgroungPath,
          width: 40,
        ),
      ),
      const SizedBox(width: 10),
      CircleAvatar(
        radius: 22,
        backgroundColor: Colors.green,
        child: CircleAvatar(
          radius: 21,
          backgroundImage: AssetImage(personImagePath),
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}

Widget body(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          backgroundImagePath,
          fit: BoxFit.cover,
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.only(top: 120),
          color: backgroundColor,
          child: listview(context, size),
        ),
      ),
      Align(
        alignment:
            size.width <= 1100 ? Alignment.bottomCenter : Alignment.topCenter,
        child: bottomNavigation(context, size),
      ),
    ],
  );
}

Widget listview(BuildContext context, Size size) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: searchBar(context),
        ),
        popularBeveragesLV(context),
        getItInstantlyLV(context)
      ],
    ),
  );
}

Widget searchBar(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(7),
    ),
    constraints: const BoxConstraints(
      maxWidth: 700,
    ),
    child: Row(
      children: [
        const SizedBox(width: 10),
        Image.asset(
          searchIconPath,
          width: 25,
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search favorite Beverages",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(
          filterIconPath,
          width: 25,
        ),
        const SizedBox(width: 10),
      ],
    ),
  );
}

Widget popularBeveragesLV(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 15,
    ),
    padding: const EdgeInsets.symmetric(vertical: 15),
    height: 330,
    decoration: const BoxDecoration(
      color: Color.fromARGB(200, 49, 49, 49),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Text(
            "Most Popular Beverages",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  bevrageCardV(context, coffeeCup4Path, () {}),
                  bevrageCardV(context, coffeeCup3Path, () {}),
                  bevrageCardV(context, coffeeCup5Path, () {}),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget getItInstantlyLV(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      left: 15,
      right: 15,
    ),
    constraints: const BoxConstraints(
      maxWidth: 600,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Get It Instantly",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
          ),
        ),
        Column(
          children: [
            beverageCardH(context, "Latte", coffeeCup1Path),
            beverageCardH(context, "Flat White", coffeeCup2Path),
          ],
        ),
      ],
    ),
  );
}
