import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

import 'package:akwaaba_user_app/imports/widgets/pages/settings/devices/top/card.dart';
import 'package:flutter/material.dart';

class TopDevicePageSettingsWidget extends StatefulWidget {
  const TopDevicePageSettingsWidget({Key? key}) : super(key: key);

  @override
  State<TopDevicePageSettingsWidget> createState() =>
      _TopDevicePageSettingsWidgetState();
}

class _TopDevicePageSettingsWidgetState
    extends State<TopDevicePageSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Device Info"),
              const Text("  :  "),
              Text(
                kIsWeb
                    ? 'Web Browser info'
                    : Platform.isAndroid
                        ? 'Android Device Info'
                        : Platform.isIOS
                            ? 'iOS Device Info'
                            : Platform.isLinux
                                ? 'Linux Device Info'
                                : Platform.isMacOS
                                    ? 'MacOS Device Info'
                                    : Platform.isWindows
                                        ? 'Windows Device Info'
                                        : '',
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: TopCardDevicePageSettingsWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
