// ignore_for_file: file_names
// import 'dart:io';
// import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
// import 'package:akwaaba_user_app/imports/classes/network/base/exceptions.dart';
// import 'package:akwaaba_user_app/imports/utilities/constants/urls/api.dart';
// import 'package:akwaaba_user_app/models/users/profile/main.dart';
// import 'package:http/http.dart' as http;

// class LoginNetwork {
//   static Future<Object> getUser() async {
//     try {
//       var url = Uri.parse(LOGIN_API_URL);
//       var response = await http.get(url);

//       if (200 == response.statusCode) {
//         return NetworkSuccess(
//           response: profileModelFromJson(response.body),
//           code: 200,
//         );
//       } else {
//         return NetworkFailure(
//           errorResponse: response.body,
//           code: response.statusCode,
//         );
//       }
//     } on SocketException catch (e) {
//       final error = NoInternetException(
//         message: "No Internt",
//         exception: e,
//       );
//       return NetworkFailure(
//         errorResponse: error,
//         code: error.code,
//       );
//     } on HttpException catch (e) {
//       final error = NoServiceFoundException(
//         message: "No Service Found",
//         exception: e,
//       );
//       return NetworkFailure(
//         errorResponse: error,
//         code: error.code,
//       );
//     } on FormatException catch (e) {
//       final error = InvalidFormatException(
//         message: "Invalid Data Format",
//         exception: e,
//       );
//       return NetworkFailure(
//         errorResponse: error,
//         code: error.code,
//       );
//     } catch (e) {
//       final error = Exception(e);
//       return NetworkFailure(
//         errorResponse: error,
//         code: error.hashCode,
//       );
//     }
//   }
// }
