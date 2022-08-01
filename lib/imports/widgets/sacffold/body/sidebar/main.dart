import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/brand.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/content.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainSidebarBodyScaffoldWidget extends StatefulWidget {
  const MainSidebarBodyScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<MainSidebarBodyScaffoldWidget> createState() =>
      _MainSidebarBodyScaffoldWidgetState();
}

class _MainSidebarBodyScaffoldWidgetState
    extends State<MainSidebarBodyScaffoldWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.removeListener(scrollControllerListener);
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  scrollControllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MainSidebarBrandBodyScaffoldWidget(),
        SingleChildScrollView(
          controller: scrollController,
          child: const ResponsiveVisibility(
            hiddenWhen: [Condition.smallerThan(name: TABLET)],
            child: MainSidebarContentBodyScaffoldWidget(),
          ),
        )
      ],
    );
  }
}
