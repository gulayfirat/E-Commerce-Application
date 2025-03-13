import 'package:dio/dio.dart';

import '../../product/statics/app_statics.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    if (_instace != null) return _instace!;
    _instace = NetworkManager._init();
    return _instace!;
  }

  final String _baseUrl = 'https://dummyjson.com/';
  late final Dio dio;

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppStatics.user?.token} '
    }));
  }
}
