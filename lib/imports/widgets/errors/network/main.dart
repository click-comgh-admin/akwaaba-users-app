// import 'dart:js_util' show hasProperty;

import 'package:akwaaba_user_app/imports/classes/forms/validation/manager.dart';
import 'package:akwaaba_user_app/imports/classes/forms/validation/non_field.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkErrorWidget extends StatefulWidget {
  final NetworkFailure? networkFailure;
  final bool showData;
  const NetworkErrorWidget(
      {Key? key, required this.networkFailure, this.showData = false})
      : super(key: key);

  @override
  State<NetworkErrorWidget> createState() => _NetworkErrorWidgetState();
}

class _NetworkErrorWidgetState extends State<NetworkErrorWidget> {
  List<NonFieldValidationForm> nonFieldErrors = [];
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    scrollController.addListener(scrollControllerListener);
    super.dispose();
  }

  scrollControllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    FormValidationManager formValidationManager =
        context.watch<FormValidationManager>();

    NetworkFailure? networkFailure = widget.networkFailure!;

    var errorResponse = networkFailure.errorResponse as dynamic;
    String? message;
    String? exception;
    try {
      // if (kDebugMode) {
      //   print({
      //     "errorResponse": errorResponse,
      //     "errorResponse.runtimeType": errorResponse.runtimeType
      //   });
      // }
      // if (hasProperty(errorResponse!, "message")) {
      if (errorResponse is Exception) {
        message = errorResponse.toString();
      }
      if (errorResponse is String) {
        message = errorResponse.toString();
      } else {
        if (errorResponse is Map) {
          if (errorResponse.containsKey("message")) {
            message = errorResponse[message].toString();
          } else {
            message = "no message";
          }
        }
      }
      // if (hasProperty(errorResponse!, "exception")) {
      if (errorResponse is Exception) {
        exception = errorResponse.toString();
      }
      if (errorResponse is String) {
        exception = errorResponse.toString();
      } else {
        if (errorResponse is Map) {
          if (errorResponse.containsKey("exception")) {
            exception = errorResponse[exception].toString();
          } else {
            exception = "no exception";
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print({"eee": e});
      }
    }
    if (widget.showData) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        formValidationManager.validationErrors(networkFailure.data!);
      });
      if (formValidationManager.nonFieldErrors.isNotEmpty) {
        nonFieldErrors = formValidationManager.nonFieldErrors;
      }
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                if (widget.showData)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: nonFieldErrors
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                e.messages,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize:
                                          body2FontSizeResponsiveSizingContantsUtilities(
                                        context,
                                      ),
                                    ),
                              ),
                            ))
                        .toList(),
                  ),
                if (!widget.showData)
                  Text(
                    "Error Code: ${networkFailure.code}",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize:
                              body2FontSizeResponsiveSizingContantsUtilities(
                            context,
                          ),
                        ),
                  ),
                if (!widget.showData)
                  Text(
                    "Message: ${message.toString()}",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize:
                              body2FontSizeResponsiveSizingContantsUtilities(
                            context,
                          ),
                        ),
                  ),
                if (!widget.showData)
                  Text(
                    "Error Exception: ${exception.toString()}",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize:
                              body2FontSizeResponsiveSizingContantsUtilities(
                            context,
                          ),
                        ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
