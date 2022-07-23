import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:flutter/material.dart';

class MessengerClockingUiCardClockerAttendancePagesHomeWidget
    extends StatelessWidget {
  final bool hasError;
  final bool showLoading;
  final NetworkFailure? errorInfo;
  final bool hasInfo;
  final String message;
  final bool showMessenger;
  const MessengerClockingUiCardClockerAttendancePagesHomeWidget({
    Key? key,
    this.hasError = false,
    this.showLoading = false,
    required this.errorInfo,
    this.hasInfo = false,
    required this.message,
    this.showMessenger = false,
  }) : super(key: key);

  successWidget(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.green,
            ),
      ),
    );
  }

  infoMessageWidget(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.orange,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showLoading) {
      return const LoadingWidget1();
    }
    if (showMessenger) {
      if (hasError) {
        return NetworkErrorWidget(
          networkFailure: errorInfo,
        );
      } else {
        if (hasInfo) {
          return infoMessageWidget(context);
        }
        return successWidget(context);
      }
    }
    return Container();
  }
}
