import 'package:dio/dio.dart';

double getDoubleFromMap(Map<String, dynamic> map, String key) {
  return (map[key] ?? 0.0).toDouble();
}

int getIntFromMap(Map<String, dynamic> map, String key) {
  return (map[key] ?? 0).toInt();
}

String getStringFromMap(Map<String, dynamic> map, String key) {
  return (map[key] ?? '').toString();
}

// DateTime getDateTimeFromMap(Map<String, dynamic> map, String key) {
//   return map[key] != null ? DateTime(year).parse(map[key]) : null;
// }

bool getBoolFromMap(Map<String, dynamic> map, String key) {
  return ((map[key] ?? 'N') as String) == 'S';
}

Future<Map<String, dynamic>> getMap(String url, {Map<String, dynamic> parameters = const {}}) async {
  final response = await getResponse(url, parameters: parameters);

  return response.data;
}

Future<Response> getResponse(String url, {Map<String, dynamic> parameters = const {}}) async {
  return _response(url, method: 'get', parameters: parameters);
}

Future<Response> _response(String url, {String method = 'get', Map<String, dynamic> parameters = const {}, int timeout = 30000}) async {
  switch (method) {
    case 'post':
      return await Dio().post(url, queryParameters: parameters).timeout(Duration(seconds: timeout));

    case 'put':
      return await Dio().put(url, queryParameters: parameters).timeout(Duration(seconds: timeout));

    case 'delete':
      return await Dio().delete(url, queryParameters: parameters).timeout(Duration(seconds: timeout));

    default:
      return await Dio().get(url, queryParameters: parameters).timeout(Duration(seconds: timeout));
  }
}
