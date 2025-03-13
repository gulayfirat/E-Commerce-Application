import 'package:hive_flutter/hive_flutter.dart';
import '../../core/base/service/base_cache_service.dart';
import '../../model/user/userCacheModel/user_cache_model.dart';
import '../../product/constant/hive_constant.dart';

class UserInfoCacheService extends BaseCacheService<UserCacheModel> {
  UserInfoCacheService({required String boxName}) : super(boxName);

  @override
  Future<void> addItems(List<UserCacheModel> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<UserCacheModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  Future<UserCacheModel?> getItem(String key) async {
    return await box?.get(key);
  }

  @override
  Future<void> putItem(String key, UserCacheModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> deleteAllItems() async {
    await box?.deleteFromDisk();
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  Future<List<UserCacheModel>?> getItems() async {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.userInfoType)) {
      Hive.registerAdapter(UserCacheModelAdapter());
    }
  }
}
