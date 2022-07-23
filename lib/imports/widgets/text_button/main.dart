import 'package:akwaaba_user_app/imports/utilities/constants/sizebox/main.dart';
import 'package:flutter/material.dart';

class TextButtonIconWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final IconData icon;
  final Color? color;
  const TextButtonIconWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? btnColor;
    if (color == null) {
      btnColor = Theme.of(context).textTheme.bodyText2!.color!;
    } else {
      btnColor = color;
    }
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // backgroundColor: btnColor,
        foregroundColor: MaterialStateProperty.all<Color?>(btnColor),
        overlayColor: MaterialStateProperty.all<Color?>(
          btnColor!.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [Text(label), width10SizeboxConstantsUtilities, Icon(icon)],
      ),
    );
  }
}
