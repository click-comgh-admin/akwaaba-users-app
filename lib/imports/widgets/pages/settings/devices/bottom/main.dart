import 'package:flutter/material.dart';

class BottomDevicePageSettingsWidget extends StatefulWidget {
  const BottomDevicePageSettingsWidget({Key? key}) : super(key: key);

  @override
  State<BottomDevicePageSettingsWidget> createState() =>
      _BottomDevicePageSettingsWidgetState();
}

class _BottomDevicePageSettingsWidgetState
    extends State<BottomDevicePageSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "title",
            style: Theme.of(context).textTheme.headline6,
          ),
          const Center(
            child: Text("Hello"),
          ),
        ],
      ),
    );
  }
}
