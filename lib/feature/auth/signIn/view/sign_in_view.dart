import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/assets/assets.dart';
import 'package:e_commerce_app/core/constants/app_text_style.dart';
import 'package:e_commerce_app/core/enums/loading_status.dart';
import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:e_commerce_app/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_app/product/router/app_router.dart';
import 'package:e_commerce_app/product/widgets/buttons/custom_elevated_button.dart';
import 'package:e_commerce_app/product/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/auth/signIn/viewModel/sign_in_cubit.dart';
import '../../../../product/constant/hive_constant.dart';
import '../../../../service/cacheService/user_info_cache_service.dart';
import '../../../../product/widgets/custom_circle_progress.dart';
import '../../../../product/widgets/custom_show_dialog.dart';
import '../viewModel/sign_in_state.dart';
part 'subView/build_form_fields.dart';
part 'subView/build_sign_in_button.dart';
part 'subView/build_sign_up_page_button.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (BuildContext context) => SignInCubit(
          cacheService:
              UserInfoCacheService(boxName: HiveConstants.userInfoBoxName)),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          state.loadingStatus == LoadingStatus.failure
              ? _buildLoginErrorDialog(context)
              : state.loadingStatus == LoadingStatus.success
                  ? context.router.popAndPush(HomeRoute())
                  : null;
        },
        builder: (context, state) {
          var read = context.read<SignInCubit>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(signInCubit: read),
          );
        },
      ),
    );
  }

  Widget _buildBody({required SignInCubit signInCubit}) {
    return Stack(
      children: [
        Image.asset(
            height: context.height,
            width: context.width,
            Assets.images.imAuthBgPNG),
        Form(
            key: signInCubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(LocaleKeys.SameKeyword_title.locale,
                          style: AppTextStyle.whiteBold52)
                      .pOnly(top: context.height * 0.1),
                  Text(LocaleKeys.SignInView_subTitle.locale,
                      style: AppTextStyle.whiteBold14),
                  _BuildFormFields(read: signInCubit, context: context),
                  Text(LocaleKeys.SignInView_forgotPass.locale,
                          style: AppTextStyle.whiteBold14)
                      .pSymetric(vertical: context.height * 0.03)
                      .gestureDetector(onTap: null),
                  _BuildSignInButton(signInCubit: signInCubit),
                  _BuildSignUpPageButton()
                ],
              ).pSymetric(horizontal: context.heighVal),
            )),
        CustomCircleProgress(
            isLoading: signInCubit.state.loadingStatus == LoadingStatus.loading
                ? true
                : false),
      ],
    );
  }

  Future<dynamic> _buildLoginErrorDialog(BuildContext context) {
    return customShowDialog(
        context: context,
        child: Container(
            width: context.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(LocaleKeys.SignInView_errorMessage.locale,
                        style: AppTextStyle.blackRegular16,
                        textAlign: TextAlign.center)
                    .pConstBottom(context),
                CustomnElevatedButton(
                    onTap: () => context.maybePop(),
                    text: LocaleKeys.SameKeyword_ok.locale)
              ],
            ).pAll(context.heighVal)));
  }
}
