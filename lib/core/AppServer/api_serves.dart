import 'package:dio/dio.dart';
import 'package:our_market/core/AppServer/key_api_sabapase.dart';

class ApiServes {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "https://kvvuxlijqefligxahoxj.supabase.co/rest/v1/",
      headers: {
        "apikey": apiKEY,
      }));
  Future<Response> getdata(String path) async {
    return await _dio.get(path);
  }

  Future<Response> postdata(String path, Map<String, dynamic> data) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> patchdata(String path, Map<String, dynamic> data) async {
    return await _dio.patch(path, data: data);
  }

  Future<Response> deletedata(String path) async {
    return await _dio.delete(path);
  }
}
