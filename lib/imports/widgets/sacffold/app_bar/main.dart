import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/action_card.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/action_image.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/search/main.dart';
import 'package:flutter/material.dart';

class AppBarScaffoldWidget extends AppBar with PreferredSizeWidget {
  final String? titleText;
  final height = 80.00;

  @override
  get preferredSize => Size.fromHeight(height);

  AppBarScaffoldWidget({Key? key, this.titleText}) : super(key: key);

  @override
  State<AppBarScaffoldWidget> createState() => _AppBarScaffoldWidgetState();
}

class _AppBarScaffoldWidgetState extends State<AppBarScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: Text("${widget.titleText}"),
        toolbarHeight: widget.height,
        elevation: 0,
        actions: [
          const ActionSearchAppBarScaffoldWidget(),
          ActionCardAppBarScaffoldWidget(
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none_sharp,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: null,
              ),
            ),
          ),
          // ActionCardAppBarScaffoldWidget(
          //   child: ThemeSettingsWidget(),
          // ),
          // ActionCardAppBarScaffoldWidget(
          //   child: LogoutButtonLoginWidget(),
          // ),
          const ActionImageAppBarScaffoldWidget(),
        ],
      ),
    );
  }
}
