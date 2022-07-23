import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/main.dart';
import 'package:flutter/material.dart';

class SidebarDrawerBodyScaffoldWidget extends StatefulWidget {
  const SidebarDrawerBodyScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<SidebarDrawerBodyScaffoldWidget> createState() =>
      _SidebarDrawerBodyScaffoldWidgetState();
}

class _SidebarDrawerBodyScaffoldWidgetState
    extends State<SidebarDrawerBodyScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: MainSidebarBodyScaffoldWidget(),
    );
  }
}
