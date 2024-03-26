class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message])
      : super(message, "Internet error issue");
}

class RequestTimeout extends AppExceptions {
  RequestTimeout([String? message]) : super(message, "The request timed out");
}

class ServerError extends AppExceptions {
  ServerError([String? message])
      : super(message, "An internal server error occurred");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message])
      : super(message, "The url provided is invalid");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Failed to fetch data from server");
}
