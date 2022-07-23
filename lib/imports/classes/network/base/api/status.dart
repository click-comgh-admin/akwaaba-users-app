class NetworkSuccess {
  int? code;
  Object? response;
  NetworkSuccess({required this.code, required this.response});
}

class NetworkFailure {
  int? code;
  Object? errorResponse;
  Object? data;
  NetworkFailure({this.code, this.data, this.errorResponse});
}
