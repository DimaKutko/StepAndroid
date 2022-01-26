import 'dart:io';

class ApiError extends HttpException {
  final int? code;
  final String? method;
  Map<String, String>? errors;

  ApiError({
    String message = 'ApiError',
    this.method,
    Uri? uri,
    this.errors,
    this.code,
  }) : super(message, uri: uri);

  @override
  String toString() {
    final b = StringBuffer()
      ..write('Error: ')
      ..write(message);
    if (method != null) {
      b.write(', method = $method');
    }
    if (uri != null) {
      b.write(', uri = $uri');
    }
    if (errors != null) {
      b.write(', errors = $errors');
    }
    return b.toString();
  }
}
