import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:flutter/material.dart';

class SidebarItemBodyScaffoldWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final void Function() onTap;

  const SidebarItemBodyScaffoldWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  State<SidebarItemBodyScaffoldWidget> createState() =>
      _SidebarItemBodyScaffoldWidgetState();
}

class _SidebarItemBodyScaffoldWidgetState
    extends State<SidebarItemBodyScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(
              widget.icon,
              color: widget.selected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: widget.selected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
              fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                context,
              ),
            ),
          ),
          onTap: widget.onTap,
        ),
        Positioned(
          top: 5,
          child: widget.selected
              ? Container(
                  width: 7,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
