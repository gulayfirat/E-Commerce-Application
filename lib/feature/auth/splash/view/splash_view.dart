import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/product/constant/hive_constant.dart';
import 'package:e_commerce_app/product/router/app_router.dart';
import 'package:e_commerce_app/service/cacheService/user_info_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/auth/splash/viewModel/splash_cubit.dart';
import 'package:e_commerce_app/feature/auth/splash/viewModel/splash_state.dart';
import '../../../../product/widgets/custom_circle_progress.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (BuildContext context) => SplashCubit(
          cacheService:
              UserInfoCacheService(boxName: HiveConstants.userInfoBoxName)),
      child: Scaffold(
        body: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            state.isLogin == true
                ? context.router.popAndPush(const HomeRoute())
                : context.router.popAndPush(const SignInRoute());
          },
          builder: (context, state) {
            return buildBody();
          },
        ),
      ),
    );
  }

  Widget buildBody() {
    return CustomCircleProgress(isLoading: true);
  }
}
