import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seequenze_app/constants.dart';
import 'package:seequenze_app/home_screen.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const SizedBox(
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned.fill(
          child: Image.asset(
            backgroundImagePath,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 80,
              horizontal: 30,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white70),
            ),
            constraints: const BoxConstraints(maxWidth: 600),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: _listView(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _listView(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      child: ListView(
        children: [
          _logoTextAndSubText(context),
          _form(context),
          _buttons(context),
          _footerText(context),
        ],
      ),
    );
  }

  Widget _logoTextAndSubText(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          kIsWeb ? const SizedBox(height: 30) : const SizedBox(),
          Image.asset(
            logoImagePath,
            width: 130,
          ),
          const Text(
            "Swift",
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontFamily: "Raleway",
            ),
          ),
          const Text(
            "Cafe",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: "Raleway",
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '"Latte but never late"',
            style: TextStyle(
              color: Colors.grey,
              shadows: [
                Shadow(
                  color: Colors.white,
                  blurRadius: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(13),
              hintText: "User Name",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(13),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buttons(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        children: [
          _customButton(context, "Login"),
          _customButton(context, "Signup", isSignupButton: true),
        ],
      ),
    );
  }

  Widget _customButton(BuildContext context, String text,
      {bool isSignupButton = false}) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 40, right: 40, top: 30),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 96, 72, 63),
              Color.fromARGB(255, 170, 107, 84),
            ],
          ),
          boxShadow: isSignupButton
              ? null
              : [
                  const BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    offset: Offset(1, 2),
                  ),
                ],
          color: isSignupButton ? Colors.transparent : Colors.brown,
          borderRadius: BorderRadius.circular(50),
          border: isSignupButton ? Border.all(color: Colors.white) : null,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _footerText(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'Privacy Policy',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
