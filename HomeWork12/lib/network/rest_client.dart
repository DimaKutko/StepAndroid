import 'dart:convert';

import 'package:homework12/errors/api_error.dart';
import 'package:homework12/network/rest_response.dart';
import 'package:http/http.dart';

abstract class RestClient {
  Future<RestResponse> get(String endpoint, {Map<String, String>? headers});

  Future<RestResponse> post(String endpoint,
      {Map<String, String>? headers, dynamic body, Encoding? encoding});

  Future<RestResponse> put(String endpoint,
      {Map<String, String>? headers, dynamic body, Encoding? encoding});

  Future<RestResponse> delete(String endpoint,
      {Map<String, String>? headers, dynamic body, Encoding? encoding});
}

typedef _PendingRequest = Future<Response> Function();

class RestClientImpl extends RestClient {
  final Client? client;

  RestClientImpl({required this.client});

  Future<StreamedResponse> send(BaseRequest request) {
    return client!.send(request);
  }

  @override
  Future<RestResponse> get(String endpoint,
      {Map<String, String>? headers}) async {
    final headersWithAuth = await _addDefaultHeader(headers);
    return _handleResponse(
        () => client!.get(Uri.parse(endpoint), headers: headersWithAuth));
  }

  @override
  Future<RestResponse> post(String endpoint,
      {Map<String, String>? headers, dynamic body, Encoding? encoding}) async {
    final headersWithAuth = await _addDefaultHeader(headers);
    return _handleResponse(() => client!.post(Uri.parse(endpoint),
        headers: headersWithAuth, body: body, encoding: encoding));
  }

  @override
  Future<RestResponse> put(String endpoint,
      {Map<String, String>? headers, dynamic body, Encoding? encoding}) async {
    final headersWithAuth = await _addDefaultHeader(headers);
    return _handleResponse(() => client!.put(Uri.parse(endpoint),
        headers: headersWithAuth, body: body, encoding: encoding));
  }

  @override
  Future<RestResponse> delete(String endpoint,
      {Map<String, String>? headers, dynamic body, Encoding? encoding}) async {
    final headersWithAuth = await _addDefaultHeader(headers);
    return _handleResponse(
        () => client!.delete(Uri.parse(endpoint), headers: headersWithAuth));
  }

  Future<Map<String, String>> _addDefaultHeader(
    Map<String, String>? headers,
  ) async {
    final resultHeaders = <String, String>{};

    if (headers != null) {
      resultHeaders.addAll(headers);
    }

    return resultHeaders;
  }

  Future<RestResponse> _handleResponse(_PendingRequest request) async {
    final response = await request();
    Map<String, String>? errors;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final map = <String, dynamic>{'data': jsonDecode(response.body)};

      return RestResponse.fromJson(map);
    } else if (response.statusCode == 400) {
      final wsResponse = RestResponse.fromJson(jsonDecode(response.body));
      errors = wsResponse.errors;
    } else if (response.statusCode == 404) {
      errors = {'not_found': 'Endpoint not found'};
    } else {
      errors = {'error_unhandled': 'Unhandled error'};
    }
    throw ApiError(
      uri: response.request!.url,
      code: response.statusCode,
      errors: errors,
      method: response.request!.method,
    );
  }
}
