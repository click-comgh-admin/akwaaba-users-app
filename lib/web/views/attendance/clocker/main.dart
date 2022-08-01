import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/drawer.dart';
import 'package:akwaaba_user_app/imports/widgets/settings/theme/main.dart';
import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
import 'package:akwaaba_user_app/view_models/users/login/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendanceClockerPageWeb extends StatefulWidget {
  const AttendanceClockerPageWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AttendanceClockerPageWeb> createState() =>
      _AttendanceClockerPageWebState();
}

class _AttendanceClockerPageWebState extends State<AttendanceClockerPageWeb> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    UserLoginViewModel userLoginViewModelCtx =
        context.watch<UserLoginViewModel>();

    ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
    scaffoldViewModelCtx.setScaffoldState = _scaffoldState;

    return Scaffold(
      key: scaffoldViewModelCtx.scaffoldState,
      drawer: const SidebarDrawerBodyScaffoldWidget(),
      appBar: AppBar(
        title: Text(
          "widget.title",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                  context,
                ),
              ),
        ),
        actions: [
          const ThemeSettingsWidget(),
          IconButton(
            onPressed: () async {
              // print({"object": "--------------"});
              await userLoginViewModelCtx.logout();
              userLoginViewModelCtx.nF();
            },
            icon: const Icon(
              Icons.logout_sharp,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AttendanceClockerPageWeb',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
