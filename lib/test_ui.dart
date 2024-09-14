import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/strings/app_language.dart';
import 'package:flutter_template/core/app/res/strings/app_strings.dart';
import 'package:flutter_template/core/app/res/theme/app_button_theme.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                  child: const Text('Text Size'),
                  onPressed: () {
                    showTextSize(context);
                  },
                ),
                FilledButton(
                  style: AppButtonTheme.secondary,
                  onPressed: () {},
                  child: Text(AppStrings.success.tr()),
                ),
                FilledButton(
                  style: AppButtonTheme.tertiary,
                  onPressed: () {},
                  child: Text(AppStrings.success.tr()),
                ),
                FilledButton(
                  style: AppButtonTheme.lightYellow,
                  onPressed: () {},
                  child: Text(AppStrings.success.tr()),
                ),
                OutlinedButton(
                  onPressed: () {
                    context.setLocale(englishLocal);
                  },
                  child: Text(AppStrings.success.tr()),
                ),
                OutlinedButton(
                  onPressed: () {
                    context.setLocale(turkishLocal);
                  },
                  style: AppButtonTheme.neutralOutline,
                  child: Text(AppStrings.success.tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showTextSize(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Display large', style: Theme.of(context).textTheme.displayLarge),
                    Text('Display medium', style: Theme.of(context).textTheme.displayMedium),
                    Text('Display small', style: Theme.of(context).textTheme.displaySmall),
                    Text('Headline small', style: Theme.of(context).textTheme.headlineLarge),
                    Text('Headline medium', style: Theme.of(context).textTheme.headlineMedium),
                    Text('Headline large', style: Theme.of(context).textTheme.headlineSmall),
                    Text('Title large', style: Theme.of(context).textTheme.titleLarge),
                    Text('Title medium', style: Theme.of(context).textTheme.titleMedium),
                    Text('Title small', style: Theme.of(context).textTheme.titleSmall),
                    Text('Label large', style: Theme.of(context).textTheme.labelLarge),
                    Text('Label medium', style: Theme.of(context).textTheme.labelMedium),
                    Text('Label small', style: Theme.of(context).textTheme.labelSmall),
                    Text('Body large', style: Theme.of(context).textTheme.bodyLarge),
                    Text('Body medium', style: Theme.of(context).textTheme.bodyMedium),
                    Text('Body small', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          );
        },
      );
}
