import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/action_card.dart';
import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DrawerButtonSidebarBodyScaffoldWidget extends StatelessWidget {
  const DrawerButtonSidebarBodyScaffoldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
    return ActionCardAppBarScaffoldWidget(
      child: IconButton(
        onPressed: () {
          GlobalKey<ScaffoldState> scaffoldState =
              scaffoldViewModelCtx.scaffoldState;

          ScaffoldState? currentState = scaffoldState.currentState;
          if (!currentState!.isDrawerOpen) {
            currentState.openDrawer();
          }
        },
        icon: Icon(
          Icons.menu_sharp,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
