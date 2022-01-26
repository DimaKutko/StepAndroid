class RestResponse {
  final Map<String, dynamic>? data;
  final List<dynamic>? list;
  final Map<String, String>? errors;

  RestResponse({this.data, this.errors, this.list});

  RestResponse.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        list = json['list'],
        errors = json['errors'] == null
            ? null
            : Map.castFrom<String, dynamic, String, String>(json['errors']);

  Map<String, dynamic> toJson() => {
        'data': data,
        'errors': errors,
      };
}
