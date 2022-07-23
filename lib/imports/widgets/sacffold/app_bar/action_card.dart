import 'package:flutter/material.dart';

class ActionCardAppBarScaffoldWidget extends StatelessWidget {
  final Widget child;
  final bool hasPadding;

  const ActionCardAppBarScaffoldWidget({
    Key? key,
    required this.child,
    this.hasPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            hasPadding ? const EdgeInsets.all(8.0) : const EdgeInsets.all(0),
        child: SizedBox(
          width: 55,
          height: 55,
          child: Center(
            child: Card(
              elevation: 15,
              shadowColor: Colors.grey.shade100.withOpacity(0.15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
