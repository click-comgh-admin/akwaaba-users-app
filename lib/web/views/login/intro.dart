import 'package:flutter/material.dart';

class LoginIntroWeb extends StatelessWidget {
  final Widget image;
  const LoginIntroWeb({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: image,);
  }
}