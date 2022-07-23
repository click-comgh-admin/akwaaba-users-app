import 'package:flutter/material.dart';

class FieldFormWidget extends StatefulWidget {
  final Key identify;
  final TextFormField child;
  const FieldFormWidget({
    Key? key,
    required this.identify,
    required this.child,
  }) : super(key: key);

  @override
  State<FieldFormWidget> createState() => _FieldFormWidgetState();
}

class _FieldFormWidgetState extends State<FieldFormWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
