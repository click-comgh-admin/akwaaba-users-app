// import 'package:akwaaba_user_app/imports/utilities/theme/manager.dart';
// import 'package:akwaaba_user_app/imports/widgets/settings/theme/main.dart';
// import 'package:akwaaba_user_app/web/views/login/intro.dart';
// import 'package:akwaaba_user_app/web/views/login/main.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_framework/responsive_framework.dart';

// class LoggedOutWeb extends StatefulWidget {
//   final ThemeManager themeManager;
//   const LoggedOutWeb({Key? key, required this.themeManager}) : super(key: key);

//   @override
//   State<LoggedOutWeb> createState() => _LoggedOutWebState();
// }

// class _LoggedOutWebState extends State<LoggedOutWeb> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("widget.title"),
//         actions: [
//           ThemeSettingsWidget(themeManager: widget.themeManager),
//         ],
//       ),
//       body: Stack(children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Row(
//             children: [
//               Expanded(flex: 1,
//                 child: Container(
//           color: Colors.white,),
//               ),
//               Expanded(flex: 1,
//                 child: Container(
//           color: Colors.grey,),
//               ),
//             ],
//           ),
//         ),
//         SingleChildScrollView(
//           padding: const EdgeInsets.all(0.0),
//           child: ResponsiveRowColumn(
//             columnCrossAxisAlignment: CrossAxisAlignment.center,
//             columnMainAxisAlignment: MainAxisAlignment.center,
//             rowCrossAxisAlignment: CrossAxisAlignment.center,
//             rowMainAxisAlignment: MainAxisAlignment.center,
//             // rowPadding: const EdgeInsets.all(30),
//             // columnPadding: const EdgeInsets.all(30),
//             layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
//                 ? ResponsiveRowColumnType.COLUMN
//                 : ResponsiveRowColumnType.ROW,
//             children: [
//               ResponsiveRowColumnItem(
//                 rowFlex: 1,
//                 child: Column(
//                   children: [
//                     ResponsiveVisibility(
//                       hiddenWhen: const [
//                         Condition.largerThan(name: TABLET),
//                       ],
//                       visibleWhen: const [
//                         Condition.smallerThan(name: TABLET),
//                       ],
//                       child: SizedBox(
//                         width: 200.00,
//                         height: 200.00,
//                         child: Padding(
//                           padding: const EdgeInsets.only(bottom: 20.0),
//                           child: LoginIntroWeb(
//                             image: Image.asset(
//                               "images/login/intro.jpg",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const LoginViewsWeb(),
//                   ],
//                 ),
//               ),
//               ResponsiveRowColumnItem(
//                 rowFlex: 2,
//                 child: ResponsiveVisibility(
//                   visible: false,
//                   hiddenWhen: const [
//                     Condition.smallerThan(name: TABLET),
//                   ],
//                   visibleWhen: const [
//                     Condition.largerThan(name: TABLET),
//                   ],
//                   child: Container(
//                     color: Colors.grey,
//                     height: MediaQuery.of(context).size.height,
//                     child: SizedBox(
//                       width: 350.00,
//                       height: 350.00,
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 20.0),
//                         child: LoginIntroWeb(
//                           image: Image.asset(
//                             "images/login/intro.jpg",
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ]),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {},
//       //   tooltip: 'Increment',
//       //   child: const Icon(Icons.add),
//       // ),
//     );
//   }
// }
