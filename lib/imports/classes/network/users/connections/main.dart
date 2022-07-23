import 'dart:io';
import 'dart:convert';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/exceptions.dart';
import 'package:akwaaba_user_app/imports/database/models/users/connections/main.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/imports/functions/api/base_url/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/urls/api.dart';
import 'package:akwaaba_user_app/models/users/connections/main.dart';
import 'package:akwaaba_user_app/models/users/connections/main_datatable.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final LoginUserModelDatabase _loginUserModelDatabase = LoginUserModelDatabase();
final ConnectionsUserModelDatabase _connectionsUserModelDatabase =
    ConnectionsUserModelDatabase();

class UserConnectionsNetwork {
  static Future<Object> myConnections(
      {Map<String, dynamic>? queryParameter}) async {
    try {
      queryParameter = queryParameter ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      var headers = {
        'Authorization': 'Token ${currentLogin!.token}',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(
          "${apiBaseUrlFunctions(MY_CONNECTIONS_API_ENDPOINTS)}/${currentLogin.memberId}");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        List<dynamic> results = json.decode(responseBody)['results'];

        List<UserConnectionsModel> connections = [];
        for (var result in results) {
          // print({"result": result});
          UserConnectionsModel connection =
              UserConnectionsModel.fromJson(result);
          // print({"connection": connection});
          if (!connections.contains(connection)) {
            connections.add(connection);
            await _connectionsUserModelDatabase.addConnection(connection);
          }
        }

        return NetworkSuccess(
          response: connections,
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
      if (kDebugMode) {
        print({"e-e-e-e": e});
      }
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }

  static Future<Object> myConnectionsDatatable(
      Map<String, dynamic> queryParameter) async {
    try {
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      var headers = {
        'Authorization': 'Token ${currentLogin!.token}',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(
          "${apiBaseUrlFunctions(MY_CONNECTIONS_API_ENDPOINTS)}/${currentLogin.memberId}?datatable_plugin&${queryParameter.toString()}");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        UserConnectionsDatatableModel connections =
            userConnectionsDatatableModelFromJson(responseBody);
        // print({"responseBody": responseBody});
        return NetworkSuccess(
          response: connections,
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

  static Future<Object> myConnectors() async {
    try {
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      var headers = {
        'Authorization': 'Token ${currentLogin!.token}',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(
          "${apiBaseUrlFunctions(MY_CONNECTORS_API_ENDPOINTS)}/${currentLogin.memberId}");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        UserConnectionsModel connection =
            userConnectionsModelFromJson(responseBody);
        // print({"responseBody": responseBody});
        await _connectionsUserModelDatabase.addConnection(connection);
        return NetworkSuccess(
          response: connection,
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
}
