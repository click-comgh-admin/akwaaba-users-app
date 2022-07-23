import 'package:akwaaba_user_app/imports/utilities/constants/scaffold/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/large.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_side.dart';
import 'package:flutter/material.dart';

class RightContentBodyScaffoldWidget extends StatefulWidget {
  final Widget title;
  final Widget child;
  final Widget? topMainChild;
  final bool showSearch;

  const RightContentBodyScaffoldWidget({
    Key? key,
    required this.title,
    required this.child,
    this.topMainChild,
    this.showSearch = true,
  }) : super(key: key);

  @override
  State<RightContentBodyScaffoldWidget> createState() =>
      _RightContentBodyScaffoldWidgetState();
}

class _RightContentBodyScaffoldWidgetState
    extends State<RightContentBodyScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        LargeAppBarScaffoldWidget(
            title: widget.title, showSearch: widget.showSearch),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: scaffoldMainBodyGutter / 4,
          ),
          child: Row(
            children: [
              MainBodyScaffoldWidget(
                topMainChild: widget.topMainChild,
                child: widget.child,
              ),
              const RightSideBodyScaffoldWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
