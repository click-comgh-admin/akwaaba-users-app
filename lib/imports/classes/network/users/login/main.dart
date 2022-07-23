import 'dart:io';
import 'dart:convert';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/exceptions.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/imports/functions/api/base_url/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/urls/api.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:http/http.dart' as http;

final LoginUserModelDatabase _loginUserModelDatabase = LoginUserModelDatabase();

class LoginNetwork {
  static Future<Object> login({required String emailPhone, required String password}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(apiBaseUrlFunctions(LOGIN_API_ENDPOINTS));
      var request = http.Request('POST', url);

      Map<String, String> requestBody = {
        "phone_email": emailPhone, 
        "password": password
      };
      // print({"requestBody": requestBody});
      
      request.body = json.encode(requestBody);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        UserLoginModel login = userLoginModelFromJson(responseBody);
        // print({"responseBody": responseBody});
        await _loginUserModelDatabase.setLogin(login);
        return NetworkSuccess(
          response: login,
          code: 200,
        );
      } else {
        String reasonPhrase = response.reasonPhrase!;
        // print({"reasonPhrase": reasonPhrase, "responseBody": responseBody});
        return NetworkFailure(
          data: json.decode(responseBody),
          errorResponse: reasonPhrase,
          code: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      final error = NoInternetException(
        message: "No Internt",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on HttpException catch (e) {
      final error = NoServiceFoundException(
        message: "No Service Found",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on FormatException catch (e) {
      final error = InvalidFormatException(
        message: "Invalid Data Format",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } catch (e) {
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }
  static Future<Object> verifyLogin() async {
    try {
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      var headers = {
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(apiBaseUrlFunctions(VERIFY_API_TOKEN_ENDPOINTS));
      var request = http.Request('POST', url);

      Map<String, String> requestBody = {
        "token": currentLogin!.token!
      };
      // print({"requestBody": requestBody});
      
      request.body = json.encode(requestBody);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        return NetworkSuccess(
          response: userLoginModelFromJson(responseBody),
          code: 200,
        );
      } else {
        String reasonPhrase = response.reasonPhrase!;
        // print({"reasonPhrase": reasonPhrase});
        return NetworkFailure(
          errorResponse: reasonPhrase,
          code: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      final error = NoInternetException(
        message: "No Internt",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on HttpException catch (e) {
      final error = NoServiceFoundException(
        message: "No Service Found",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on FormatException catch (e) {
      final error = InvalidFormatException(
        message: "Invalid Data Format",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } catch (e) {
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }
}
