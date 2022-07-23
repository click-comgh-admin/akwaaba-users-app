import 'package:akwaaba_user_app/imports/utilities/constants/status_codes/http.dart';

class NetworkExceptions {
  int? code;
  String message;
  Exception? exception;
  NetworkExceptions({this.code, this.exception, required this.message});
}

class NoInternetException extends NetworkExceptions {
  NoInternetException({
    super.code = HTTP_503_SERVICE_UNAVAILABLE,
    super.exception,
    required super.message,
  });
}


class NoServiceFoundException extends NetworkExceptions {
  NoServiceFoundException({
    super.code = HTTP_404_NOT_FOUND,
    super.exception,
    required super.message,
  });
}

class InvalidFormatException extends NetworkExceptions {
  InvalidFormatException({
    super.code = HTTP_400_BAD_REQUEST,
    super.exception,
    required super.message,
  });
}


class UnknownException extends NetworkExceptions {
  UnknownException({
    super.code = HTTP_400_BAD_REQUEST,
    super.exception,
    required super.message,
  });
}
