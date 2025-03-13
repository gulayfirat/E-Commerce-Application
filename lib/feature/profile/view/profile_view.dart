import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/constants/app_text_style.dart';
import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:e_commerce_app/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_app/product/router/app_router.dart';
import 'package:e_commerce_app/product/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/product/widgets/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/profile/viewModel/profile_cubit.dart';
import 'package:e_commerce_app/feature/profile/viewModel/profile_state.dart';

import '../../../product/constant/hive_constant.dart';
import '../../../product/widgets/buttons/custom_elevated_button.dart';
import '../../../service/cacheService/user_info_cache_service.dart';
part 'subView/build_profile_info.dart';
part 'subView/build_logout_dialog.dart';
part 'subView/build_about_profile_operations.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(
          cacheService:
              UserInfoCacheService(boxName: HiveConstants.userInfoBoxName)),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (BuildContext context, ProfileState state) {
          state.isLogout == true
              ? context.router.popAndPush(SignInRoute())
              : null;
        },
        builder: (BuildContext context, ProfileState state) {
          ProfileCubit read = context.read<ProfileCubit>();
          return Scaffold(
              appBar:
                  CustomAppBar(title: LocaleKeys.Profile_appBarTitle.locale),
              body: buildBody(read));
        },
      ),
    );
  }

  Widget buildBody(ProfileCubit profileCubit) {
    return _BuildAboutProfileOperations(
      context: context,
      profileCubit: profileCubit,
    );
  }
}
