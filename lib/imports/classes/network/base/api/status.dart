class NetworkSuccess {
  int? code;
  Object? response;
  NetworkSuccess({required this.code, required this.response});

  @override
  String toString() {
    return '{"code": "$code", "response": "$response", }';
  }
}

class NetworkFailure {
  int? code;
  Object? errorResponse;
  Object? data;
  NetworkFailure({this.code, this.data, this.errorResponse});

  @override
  String toString() {
    return '{"code": "$code", "errorResponse": "$errorResponse", "data": "$data", }';
  }
}
