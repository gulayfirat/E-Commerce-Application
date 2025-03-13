import 'package:dio/dio.dart';

class HandleServiceError {
  void handleError(DioException error) {
    switch (error.type) {
      case DioException.connectionError:
        print('Connection time exceeded!');
        break;
      case DioException.sendTimeout:
        print('Request submission time exceeded!');
        break;
      case DioException.receiveTimeout:
        print('Response time exceeded!');
        break;
      case DioException.badResponse:
        if (error.response?.statusCode == 404) {
          print('Source not found (404)');
        } else if (error.response?.statusCode == 500) {
          print('Server error (500)');
        } else {
          print('Error: ${error.response?.statusCode}');
        }
        break;
      case DioException.requestCancelled:
        print('Request cancelled!');
        break;
      default:
        print('An unknown error occurred!');
    }
  }
}
