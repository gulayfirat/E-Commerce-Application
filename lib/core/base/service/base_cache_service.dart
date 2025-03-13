import 'package:hive/hive.dart';

abstract class BaseCacheService<T> {
  final String key;
  //T type the hive box
  Box<T>? box;

  BaseCacheService(this.key);
  //Initial manager
  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(key);
    }
  }

  void registerAdapters();

  Future<void> deleteAllItems() async => await box?.deleteFromDisk();

  Future<void> addItems(List<T> items);

  Future<void> putItems(List<T> items);

  Future<T?> getItem(String key);

  Future<List<T>?> getItems();

  Future<void> putItem(String key, T item);

  Future<void> removeItem(String key);
}
