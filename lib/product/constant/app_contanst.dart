import '../router/app_router.dart';

class AppConstant {
  AppConstant._init();
  static AppConstant? _instance;
  static AppConstant get instance {
    _instance ??= AppConstant._init();
    return _instance!;
  }

  static final appRouter = AppRouter();
}
