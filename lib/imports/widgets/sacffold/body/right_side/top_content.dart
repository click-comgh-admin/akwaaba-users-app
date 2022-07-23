import 'package:akwaaba_user_app/imports/functions/datetime/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/padding_margin/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizebox/main.dart';
import 'package:akwaaba_user_app/imports/widgets/text_button/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:flutter/material.dart';

class TopContentRightsideBodyScaffoldWidget extends StatefulWidget {
  final UserLoginModel loginInfo;
  const TopContentRightsideBodyScaffoldWidget({
    Key? key,
    required this.loginInfo,
  }) : super(key: key);

  @override
  State<TopContentRightsideBodyScaffoldWidget> createState() =>
      _TopContentRightsideBodyScaffoldWidgetState();
}

class _TopContentRightsideBodyScaffoldWidgetState
    extends State<TopContentRightsideBodyScaffoldWidget> {
  late DateTime dateTime;
  @override
  void initState() {
    dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pAll16PaddingMarginConstantsUtilities,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello ${widget.loginInfo.user!.firstname}",
                style: Theme.of(context).textTheme.headline5,
              ),
              height10SizeboxConstantsUtilities,
              SizedBox(
                width: (width10SizeboxConstantsUtilities.width! * 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dateTimeCol(
                      context,
                      title: "Today",
                      content: formatDateDatetimeFunction(dateTime),
                    ),
                    dateTimeCol(
                      context,
                      title: "Time",
                      content: formatTimeDatetimeFunction(dateTime),
                    ),
                  ],
                ),
              ),
              height10SizeboxConstantsUtilities,
              dateTimeCol(
                context,
                title: "Login Info",
                content:
                    "On ${formatDateDatetimeFunction(widget.loginInfo.loginDate!)} @ ${formatTimeDatetimeFunction(widget.loginInfo.loginDate!)}",
              ),
            ],
          ),
          height10SizeboxConstantsUtilities,
          const TextButtonIconWidget(
            onPressed: null,
            icon: Icons.arrow_right_alt_sharp,
            label: "Go to my account",
          ),
        ],
      ),
    );
  }

  Column dateTimeCol(BuildContext context,
      {required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.caption),
        Text(content),
      ],
    );
  }
}
