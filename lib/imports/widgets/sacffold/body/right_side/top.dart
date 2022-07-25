import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/no_data_found/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_side/top_content.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:akwaaba_user_app/view_models/users/login/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopRightsideBodyScaffoldWidget extends StatefulWidget {
  const TopRightsideBodyScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<TopRightsideBodyScaffoldWidget> createState() =>
      _TopRightsideBodyStateScaffoldWidget();
}

class _TopRightsideBodyStateScaffoldWidget
    extends State<TopRightsideBodyScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    UserLoginViewModel loginViewModel = context.watch<UserLoginViewModel>();
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/dashboard/plant.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned.fill(
              child: FutureBuilder(
                future: loginViewModel.getLogin,
                builder: (BuildContext context,
                    AsyncSnapshot<UserLoginModel?> snapshot) {
                  if (kDebugMode) {
                    // print({"snapshot": snapshot.connectionState});
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingWidget1(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const NoDataFoundWidget();
                  }
                  return TopContentRightsideBodyScaffoldWidget(
                    loginInfo: snapshot.data!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
