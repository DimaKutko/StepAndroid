const prodBaseUrl = 'https://carrie.freseniusmedicalcare.com/api/v1';
const devBaseUrl = 'https://fresenius.id-di.de/api/v1';

abstract class HttpMethod {
  // ignore: constant_identifier_names
  static const String GET = 'GET';
  // ignore: constant_identifier_names
  static const String POST = 'POST';
  // ignore: constant_identifier_names
  static const String PUT = 'PUT';
  // ignore: constant_identifier_names
  static const String DELETE = 'DELETE';
  // ignore: constant_identifier_names
  static const String PATH = 'PATCH';
}

abstract class HttpHeaders {
  // ignore: constant_identifier_names
  static const CONTENT_TYPE = 'Content-type';
  // ignore: constant_identifier_names
  static const JSON_HEADER = 'application/json';
  // ignore: constant_identifier_names
  static const JPEG_HEADER = 'image/jpeg';
  // ignore: constant_identifier_names
  static const PNG_HEADER = 'image/png';
  // ignore: constant_identifier_names
  static const GIF_HEADER = 'image/gif';
  // ignore: constant_identifier_names
  static const PDF_HEADER = 'application/pdf';
  // ignore: constant_identifier_names
  static const FORM_ENCODED_HEADER = 'application/x-www-form-urlencoded';
  // ignore: constant_identifier_names
  static const AUTHORIZATION = 'Authorization';
  // ignore: constant_identifier_names
  static const ACCEPT_LANGUAGE = 'Accept-Language';
}
