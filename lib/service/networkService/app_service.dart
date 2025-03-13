import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/base/service/base_service.dart';
import '../../core/base/model/base_model.dart';
import '../../core/base/service/handle_service_error.dart';
import '../../core/enums/service_path.dart';
import '../../core/manager/network_manager.dart';

class AppService extends BaseService {
  static AppService? _instace;
  static AppService get instance {
    if (_instace != null) return _instace!;
    _instace = AppService();
    return _instace!;
  }

  Future<dynamic> getListData<T extends BaseModel>({
    T? objectModel,
    String? onResponsePath,
    required String path,
  }) async {
    try {
      final response = await NetworkManager.instance.dio.get(path);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List && data.isNotEmpty && data.first is String) {
          return List<String>.from(data);
        } else if (data is List) {
          final resultPosts =
              List<T>.from(data.map((e) => objectModel?.fromJson(e)));
          return resultPosts;
        } else if (data is Map<String, dynamic>) {
          final resultPosts = List<T>.from(
              data[onResponsePath].map((e) => objectModel?.fromJson(e)));
          return resultPosts;
        }
      }
    } on DioException catch (e) {
      print('Error: $e');
      HandleServiceError().handleError(e);
      return null;
    }
    return null;
  }

  Future<dynamic> getObjectData<T extends BaseModel>({
    required T objectModel,
    required String path,
  }) async {
    try {
      final response = await NetworkManager.instance.dio.get(path);

      if (response.statusCode == HttpStatus.ok) {
        return objectModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      print('Error: $e');
      HandleServiceError().handleError(e);
      return false;
    }
  }

  Future<bool?> createData<T extends BaseModel>({
    required T objectModel,
    required ServicePath path,
  }) async {
    try {
      Response response = await NetworkManager.instance.dio
          .post(path.subUrl, data: objectModel.toJson());
      log(response.toString());
      return true;
    } on DioException catch (e) {
      HandleServiceError().handleError(e);
      return false;
    }
  }

  Future<bool?> updateData<T extends BaseModel>(
      {required T objectModel, required String path}) async {
    final response =
        await NetworkManager.instance.dio.put(path, data: objectModel.toJson());
    if (response.statusCode == HttpStatus.ok)
      return true;
    else
      return false;
  }

  Future<bool?> deleteData<T extends BaseModel>({required String path}) async {
    final response = await NetworkManager.instance.dio.delete(path);
    if (response.statusCode == HttpStatus.ok)
      return true;
    else
      return false;
  }
}
