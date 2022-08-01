import 'package:akwaaba_user_app/imports/utilities/constants/sizing/padding_margin/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/scaffold/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainSidebarBrandBodyScaffoldWidget extends StatelessWidget {
  const MainSidebarBrandBodyScaffoldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scaffoldAppbarBodyHeight,
      child: Padding(
        padding: pAll8PaddingMarginConstantsUtilities,
        child: Text(
          "Akwaaba App",
          style: GoogleFonts.antic(
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
