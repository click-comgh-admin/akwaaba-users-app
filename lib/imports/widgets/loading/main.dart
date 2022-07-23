import 'package:flutter/cupertino.dart';

class LoadingWidget1 extends StatelessWidget {
  const LoadingWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator();
  }
}