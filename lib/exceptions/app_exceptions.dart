class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process data', url);
}

class ApiNotRespospondingException extends AppException {
  ApiNotRespospondingException([String? message, String? url])
      : super(message, 'APi not responding', url);
}
