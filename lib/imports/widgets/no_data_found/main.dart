import 'package:flutter/material.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No Data Found"),
    );
  }
}
