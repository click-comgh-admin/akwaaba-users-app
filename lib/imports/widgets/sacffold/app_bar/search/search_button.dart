import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/action_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButtonAppBarScaffoldWidget extends StatelessWidget {
  const SearchButtonAppBarScaffoldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionCardAppBarScaffoldWidget(
      child: IconButton(
        onPressed: () {
          AutoRouter.of(context).push(const SearchRouteWeb());
        },
        icon: Icon(
          CupertinoIcons.search,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
