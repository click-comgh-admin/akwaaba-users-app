import 'dart:io';
import 'dart:convert';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/exceptions.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/imports/functions/api/base_url/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/urls/api.dart';
import 'package:akwaaba_user_app/models/types/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final LoginUserModelDatabase _loginUserModelDatabase = LoginUserModelDatabase();

class AttendanceSchedulePlaceNetwork {
  static Future<Object> virtualMeetingType(
    int typeId, {
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      queryParameter = queryParameter ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(
          "${apiBaseUrlFunctions(VIRTUAL_MEETING_TYPE_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}/$typeId");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        dynamic responseResponse = json.decode(responseBody);
        bool success = responseResponse['success'];
        TypesModel? virtualMeetingType;
        if (success) {
          Map<String, dynamic> data = responseResponse['data'] as Map<String, dynamic>;
          virtualMeetingType = TypesModel.fromJson(data);
          // print({"virtualMeetingType": virtualMeetingType});
          // await _schedulesUserModelDatabase.addAttendanceSchedule(virtualMeetingType);
        }

        return NetworkSuccess(
          response: virtualMeetingType,
          code: response.statusCode,
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

  static Future<Object> meetingPlace(
    int placeId, {
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      queryParameter = queryParameter ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(
          "${apiBaseUrlFunctions(MEETING_PLACE_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}/$placeId");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        dynamic responseResponse = json.decode(responseBody);
        bool success = responseResponse['success'];
        TypesModel? meetingPlace;
        if (success) {
          Map<String, dynamic> data = responseResponse['data'] as Map<String, dynamic>;
          meetingPlace = TypesModel.fromJson(data);
          // print({"meetingPlace": meetingPlace});
          // await _schedulesUserModelDatabase.addAttendanceSchedule(meetingPlace);
        }

        return NetworkSuccess(
          response: meetingPlace,
          code: response.statusCode,
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
}
