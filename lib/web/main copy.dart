// ignore_for_file: file_names
// // ignore_for_file: avoid_print

// import 'dart:io';

// import 'package:akwaaba_user_app/imports/functions/open_hive_dbs/main.dart';
// import 'package:akwaaba_user_app/imports/utilities/theme/constants.dart';
// import 'package:akwaaba_user_app/imports/utilities/theme/manager.dart';
// import 'package:akwaaba_user_app/models/settings/theme/main.dart';
// import 'package:akwaaba_user_app/models/users/login/main.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive_flutter/adapters.dart';

// Future<void> main() async {
//   await Hive.initFlutter();

//   if (kIsWeb) {
//     Hive
//       ..initFlutter()
//       ..registerAdapter(SettingsThemeAdapter())
//       ..registerAdapter(UserLoginModelAdapter());
//   }
//   openHiveDbs();
//   runApp(const MyApp());
// }

// ThemeManager _themeManager = ThemeManager();

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void dispose() {
//     _themeManager.removeListener(themeListener);
//     super.dispose();
//   }

//   @override
//   void initState() {
//     _themeManager.setMemberId = 4;
//     _themeManager.addListener(themeListener);
//     super.initState();
//   }

//   themeListener() {
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: lightTheme,
//       darkTheme: darkTheme,
//       themeMode: _themeManager.themeMode,
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   Future<void> _incrementCounter() async {
//     await dotenv.load(fileName: ".env", mergeWith: {
//       'TEST_VAR': '5',
//       'IN_PRODUCTION': 'false',
//     }); // mergeWith optional, you can include Platform.environment for Mobile/Desktop app
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//     // var ccc = await rootBundle.loadString('.env');
//     // print({'ccc': ccc, 'POPE': dotenv.get('POPE', fallback: 'Default fallback value')});
//     print({
//       'TEST_VAR': dotenv.get('TEST_VAR', fallback: 'Default fallback value')
//     });
//     print({
//       'IN_PRODUCTION':
//           dotenv.get('IN_PRODUCTION', fallback: 'Default fallback value')
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//         actions: [
//           Switch(
//               value: _themeManager.themeMode == ThemeMode.dark,
//               onChanged: (newValue) {
//                 _themeManager.toggleTheme(newValue);
//               })
//         ],
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
