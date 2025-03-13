import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/router/app_router.dart';
import '../viewModel/change_language_cubit.dart';

@RoutePage()
class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeLanguageCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.ChangeLanguageView_appBarTitle.locale),
        ),
        body: const _BuildBody(),
      ),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeLanguageCubit, ChangeLanguageState>(
      listener: (context, state) {},
      builder: (context, state) {
        var read = context.read<ChangeLanguageCubit>();
        return Column(
          children: [_BuildLanguageCard(read: read)],
        );
      },
    );
  }
}

class _BuildLanguageCard extends StatelessWidget {
  const _BuildLanguageCard({
    required this.read,
  });

  final ChangeLanguageCubit read;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: context.border10Radius),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        onExpansionChanged: (_) => read.getSelectedLanguage(context),
        title: Text(LocaleKeys.ChangeLanguageView_changeLanguage.locale),
        children: List.generate(
          read.languageList.length,
          (index) => RadioListTile(
            title: Text(read.languageList[index],
                style: Theme.of(context).textTheme.labelLarge),
            value: read.languageList[index],
            selected: true,
            groupValue: read.state.selectedLanguage,
            onChanged: (value) {
              read.onChangeLanguage(context, value);
              context.router.push(const HomeRoute());
            },
          ),
        ),
      ),
    );
  }
}
