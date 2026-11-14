import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';
import 'package:qwys/features/features.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const double _iconSize = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeAnimation(
          child: Padding(
            padding: const EdgeInsets.all(mPadding),
            child: Column(
              spacing: sPadding,
              children: [
                Expanded(
                  child: Column(
                    spacing: xlPadding,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildIcon(),
                      _buildDescription(),
                      _buildButton(),
                    ],
                  ),
                ),
                _buildSwitchers(),
                _buildVersion(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      ThemeIcons.puzzle,
      size: _iconSize,
    );
  }

  Widget _buildDescription() {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      spacing: lPadding,
      children: [
        Text(
          t.home.title,
          style: textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          t.home.description,
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildButton() {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colors;

    return Column(
      spacing: sPadding,
      children: [
        AppButton(
          onPressed: () => context.push('/quizzes'),
          title: Text(t.action.start),
          buttonColor: ButtonColor.inv,
        ),
        Text(
          t.home.locale_note,
          style: textTheme.labelSmall?.copyWith(
            color: colors.textIconSecondaryDefault,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSwitchers() {
    return Column(
      spacing: sPadding,
      children: [
        _buildThemeSwitcher(),
        _buildLocaleSwitcher(),
      ],
    );
  }

  Widget _buildThemeSwitcher() {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final themeCubit = context.read<ThemeCubit>();

        return ThemeSwitcher(
          selectedMode: themeCubit.currentAppThemeMode,
          onChanged: themeCubit.setTheme,
        );
      },
    );
  }

  Widget _buildLocaleSwitcher() {
    return BlocBuilder<LocaleCubit, AppLocale>(
      builder: (context, locale) {
        return LocaleSwitcher(
          selectedLocale: locale,
          onChanged: context.read<LocaleCubit>().setLocale,
        );
      },
    );
  }

  Widget _buildVersion() => AppVersion();
}
