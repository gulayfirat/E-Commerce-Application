import '../../enums/service_path.dart';
import '../model/base_model.dart';

abstract class BaseService {
  Future<dynamic> getListData<T extends BaseModel>(
      {T? objectModel, String? onResponsePath, required String path});

  Future<dynamic> getObjectData<T extends BaseModel>(
      {required T objectModel, required String path});

  Future<bool?> createData<T extends BaseModel>(
      {required T objectModel, required ServicePath path});

  Future<bool?> updateData<T extends BaseModel>(
      {required T objectModel, required String path});

  Future<bool?> deleteData<T extends BaseModel>({required String path});
}
