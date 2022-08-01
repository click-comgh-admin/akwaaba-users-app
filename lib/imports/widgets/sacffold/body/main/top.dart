import 'package:akwaaba_user_app/imports/utilities/constants/sizing/sizebox/main.dart';
import 'package:flutter/material.dart';

class TopMainBodyScaffoldWidget extends StatefulWidget {
  final Widget? topMainChild;
  const TopMainBodyScaffoldWidget({Key? key, this.topMainChild})
      : super(key: key);

  @override
  State<TopMainBodyScaffoldWidget> createState() =>
      _TopMainBodyStateScaffoldWidget();
}

class _TopMainBodyStateScaffoldWidget extends State<TopMainBodyScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.topMainChild != null
        ? Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 210,
                  minWidth: double.infinity,
                ),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: widget.topMainChild,
                  ),
                ),
              ),
              height25SizeboxConstantsUtilities,
              height25SizeboxConstantsUtilities,
            ],
          )
        : Container();
  }
}
