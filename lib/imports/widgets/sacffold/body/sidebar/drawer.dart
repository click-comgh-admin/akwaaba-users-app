import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/brand.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/content.dart';
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
    return Drawer(
      child: Column(
        children: const [
          MainSidebarBrandBodyScaffoldWidget(),
          SingleChildScrollView(child: MainSidebarContentBodyScaffoldWidget()),
        ],
      ),
    );
  }
}
