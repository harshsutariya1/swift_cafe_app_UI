import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:seequenze_app/constants.dart';

class BeverageDetailScreen extends StatelessWidget {
  const BeverageDetailScreen({
    super.key,
    required this.beverageName,
    required this.beverageImagePath,
  });
  final String beverageName;
  final String beverageImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(width: double.infinity),
        Positioned.fill(
          child: Image.asset(
            backgroundImagePath,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: _image(context),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _details(context),
        ),
      ],
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      height: 460,
      width: double.infinity,
      child: Image.asset(
        beverageImagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _details(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: const Border(
            top: BorderSide(
          color: Colors.white54,
        )),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: backgroundColor,
      ),
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      margin: const EdgeInsets.only(top: 450),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _beverageDetails(context),
                _choiceOfFilling(context),
                _choiceOfMilk(context),
                _choiseOfSugar(context),
                _submitButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _beverageDetails(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 15,
        right: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beverageName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "4.5",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        starIconPath,
                        width: 15,
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "(458)",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        vegIconPath,
                        width: 15,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    const Text("1"),
                    const VerticalDivider(
                      thickness: 5,
                      color: Colors.transparent,
                    ),
                    ImageIcon(AssetImage(arrowIconPath)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            coffeeDescription,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _choiceOfFilling(BuildContext context) {
    List<String> choiceName = [
      "Full",
      "1/2 Full",
      "3/4 Full",
      "1/4 Full",
    ];
    return Container(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 15,
        right: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choise fo Cup Filling",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 25,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: choiceName.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: (index == 0)
                              ? Colors.green
                              : const Color.fromARGB(255, 217, 217, 217),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          choiceName[index],
                          style: TextStyle(
                            color: (index == 0) ? Colors.white : Colors.black87,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _choiceOfMilk(BuildContext context) {
    List<String> firstGroup = [
      "Skim Milk",
      "Almond Milk",
      "Soy Milk",
      "Lactose Free Milk",
    ];
    List<String> secondGroup = [
      "Full Cream Milk",
      "Full Cream Milk",
      "Oat Milk",
    ];
    return Container(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 15,
        right: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choise of Milk",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.topLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (String i in firstGroup)
                        _choice(switchOffIconPath, i),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (String i in secondGroup)
                        _choice(
                            (secondGroup.indexOf(i) == 0)
                                ? switchOnIconPath
                                : switchOffIconPath,
                            i),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _choice(String switchImage, String text) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(
        bottom: 5,
        right: 5,
      ),
      child: Row(
        children: [
          Image.asset(switchImage, width: 30),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _choiseOfSugar(BuildContext context) {
    List<String> firstGroup = [
      "Sugar X1",
      "½ Sugar",
    ];
    List<String> secondGroup = [
      "Sugar X2",
      "No Sugar",
    ];
    return Container(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 15,
          right: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choise of Sugar",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Container(
                alignment: Alignment.topLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (String i in firstGroup)
                          _choice(switchOffIconPath, i),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (String i in secondGroup)
                          _choice(
                              (secondGroup.indexOf(i) == 0)
                                  ? switchOnIconPath
                                  : switchOffIconPath,
                              i),
                      ],
                    ),
                  ],
                )),
          ],
        ));
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 51, 51, 51).withOpacity(.84),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(
        bottom: 30,
        top: 10,
        right: 30,
        left: 30,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const SizedBox(width: 30),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "High Priority ",
            style: TextStyle(color: Colors.white),
          ),
          Image.asset(
            errorIconPath,
            width: 20,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 74, 161, 77),
            ),
            child: const Text(
              "Submit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
