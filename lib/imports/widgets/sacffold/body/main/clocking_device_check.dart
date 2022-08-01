import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:akwaaba_user_app/view_models/users/login/main.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClockingDeviceCheckMainBodyScaffoldWidget extends StatefulWidget {
  const ClockingDeviceCheckMainBodyScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<ClockingDeviceCheckMainBodyScaffoldWidget> createState() =>
      _ClockingDeviceCheckMainBodyScaffoldWidgetState();
}

class _ClockingDeviceCheckMainBodyScaffoldWidgetState
    extends State<ClockingDeviceCheckMainBodyScaffoldWidget> {
  bool calledUserModel = false;
  @override
  void initState() {
    super.initState();
    callUserModel(context);
  }

  callUserModel(BuildContext ctx) async {
    UserLoginViewModel userLoginViewModelCtx =
        Provider.of<UserLoginViewModel>(ctx, listen: false);
    UserLoginModel userLoginModel = userLoginViewModelCtx.userLoginModel;
    // print({"userLoginModel": userLoginModel.toString()});
    if (userLoginModel.extraInfo != null) {
      // print({"userLoginModel": userLoginModel.toString()});
      await ArtSweetAlert.show(
        barrierDismissible: false,
        context: context,
        artDialogArgs: ArtDialogArgs(
          showCancelBtn: true,
          confirmButtonText: "Request new device",
          cancelButtonText: "Continue",
          confirmButtonColor: Colors.green,
          type: ArtSweetAlertType.info,
          title: "Login Successful",
          customColumns: userLoginModel.extraInfo!.deviceInfoMsg!
              .map(
                (message) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                  ),
                  child: Text(message),
                ),
              )
              .toList(),
          onCancel: () {
            userLoginViewModelCtx.nF(); //LOGIN
          },
          onConfirm: () {
            userLoginViewModelCtx.nF(); //LOGIN
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
