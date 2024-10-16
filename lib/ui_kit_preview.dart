import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'package:flutter_template/core/app/res/strings/app_language.dart';
import 'package:flutter_template/core/app/res/strings/app_strings.dart';
import 'package:flutter_template/core/app/utility/sub_extension/context/context_theme_extension.dart';
import 'package:flutter_template/core/feature/presentation/cubit/themes_cubit.dart';

class UiKitPreview extends StatefulWidget {
  const UiKitPreview({super.key});

  @override
  State<UiKitPreview> createState() => _UiKitPreviewState();
}

class _UiKitPreviewState extends State<UiKitPreview> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(AppStrings.success.tr()),
        actions: [
          // Button for change language
          IconButton(
            onPressed: () {
              context.locale == const Locale('fa', 'IR') ? context.setLocale(englishLocal) : context.setLocale(persianLocal);
            },
            icon: const Icon(Icons.language),
          ),
          // Button for change theme
          IconButton(
            onPressed: () {
              locator<ThemesCubit>().toggleTheme();
              // context.isDarkMode ? context.setThemeMode(ThemeMode.light) : context.setThemeMode(ThemeMode.dark);
            },
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: context.colorScheme.primary,
              padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 16.w),
              height: 200.h,
              child: Text(
                'Drawer header',
                style: context.textTheme.headlineSmall?.copyWith(color: context.colorScheme.onPrimary),
              ),
            ),
            ListTile(title: const Text('Message'), leading: const Icon(Icons.message), onTap: () {}),
            SizedBox(height: 16.h),
            ListTile(title: const Text('Profile'), leading: const Icon(Icons.person), onTap: () {}),
            SizedBox(height: 16.h),
            ListTile(title: const Text('Setting'), leading: const Icon(Icons.settings), onTap: () {}),
          ],
        ),
      ),
      body: Column(
        children: [
          // Tab bar view
          TabBar(
            controller: _tabController,
            tabs: const [
              Column(
                children: [
                  Icon(Icons.touch_app),
                  Text('Buttons'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.keyboard),
                  Text('Inputs'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.select_all),
                  Text('Selections'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.text_fields),
                  Text('Texts'),
                ],
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _tabButton(context),
                _tabInput(context),
                _tabSelection(context),
                _tabText(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }

  _tabButton(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          //* Elevated Button
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
              SizedBox(width: 20.w),
              const ElevatedButton(
                onPressed: null,
                child: Text('Disabled'),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          //* Elevated Icon Button
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text('Elevated Button'),
                icon: const Icon(Icons.favorite),
              ),
              SizedBox(width: 20.w),
              ElevatedButton.icon(
                onPressed: null,
                label: const Text('Disabled'),
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          //* Filled Button
          Row(
            children: [
              FilledButton(
                onPressed: () {},
                child: const Text('Filled Button'),
              ),
              SizedBox(width: 20.w),
              const FilledButton(
                onPressed: null,
                child: Text('Disabled'),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          //* Filled Icon Button
          Row(
            children: [
              FilledButton.icon(
                onPressed: () {},
                label: const Text('Filled Button'),
                icon: const Icon(Icons.favorite),
              ),
              SizedBox(width: 20.w),
              FilledButton.icon(
                onPressed: null,
                label: const Text('Disabled'),
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          //* Outlined Button
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined Button'),
              ),
              SizedBox(width: 20.w),
              const OutlinedButton(
                onPressed: null,
                child: Text('Disabled'),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          //* Outlined Icon Button
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                label: const Text('Outlined Button'),
                icon: const Icon(Icons.favorite),
              ),
              SizedBox(width: 20.w),
              OutlinedButton.icon(
                onPressed: null,
                label: const Text('Disabled'),
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          //* Text Button
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Text Button'),
              ),
              SizedBox(width: 20.w),
              const TextButton(
                onPressed: null,
                child: Text('Disabled'),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          //* Text Icon Button
          Row(
            children: [
              TextButton.icon(
                onPressed: () {},
                label: const Text('Text Button'),
                icon: const Icon(Icons.favorite),
              ),
              SizedBox(width: 20.w),
              TextButton.icon(
                onPressed: null,
                label: const Text('Disabled'),
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(),
          //* Icon Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Icon buttons'),
              Row(
                children: [
                  Text(
                    'Enabled',
                    style: context.textTheme.bodyMedium?.copyWith(color: context.disabledColor),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    'Disabled',
                    style: context.textTheme.bodyMedium?.copyWith(color: context.disabledColor),
                  ),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.favorite),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _tabInput(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Label',
            ),
          ),
          SizedBox(height: 16.h),
          const TextField(
            decoration: InputDecoration(
              enabled: false,
              hintText: 'Disabled',
            ),
          ),
          SizedBox(height: 16.h),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Hint',
              helperText: 'Helper',
              counterText: 'Counter',
            ),
          ),
          SizedBox(height: 16.h),
          const TextField(
            decoration: InputDecoration(
              prefix: Text('Prefix:'),
              suffixText: 'Suffix',
            ),
          ),
          SizedBox(height: 16.h),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Label',
              errorText: 'Error',
            ),
          ),
        ],
      ),
    );
  }

  _tabSelection(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          //* Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Switch enabled'),
              Switch(
                value: true,
                onChanged: (_) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Switch disabled',
                style: context.textTheme.bodyMedium?.copyWith(color: context.disabledColor),
              ),
              const Switch(
                value: true,
                onChanged: null,
              ),
            ],
          ),
          const Divider(),

          //* Checkbox
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Checkbox'),
              Checkbox(
                value: true,
                onChanged: (_) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Checkbox',
                style: context.textTheme.bodyMedium?.copyWith(color: context.disabledColor),
              ),
              const Checkbox(
                value: true,
                onChanged: null,
              ),
            ],
          ),
          const Divider(),

          //* Radio
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Radio1'),
              Radio(
                value: true,
                groupValue: true,
                onChanged: (_) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Radio2'),
              Radio(
                value: false,
                groupValue: true,
                onChanged: (_) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Radio3'),
              Radio(
                value: false,
                groupValue: true,
                onChanged: (_) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Radio',
                style: context.textTheme.bodyMedium?.copyWith(color: context.disabledColor),
              ),
              const Radio(
                value: true,
                groupValue: true,
                onChanged: null,
              ),
            ],
          ),

          const Divider(),
          //* Slider
          const Text('Slider'),

          Slider(
            value: 0.5,
            onChanged: (_) {},
          ),
          Slider.adaptive(
            value: 0.1,
            onChanged: (value) {},
          ),
          const Slider(
            value: 0.5,
            onChanged: null,
          ),
          const Divider(),
          //* DateTime Picker
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Data picker: '),
              TextButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now(),
                  );
                },
                child: const Text('Pick Date'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Time picker: '),
              TextButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                child: const Text('Pick Time'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _tabText(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Display large', style: context.textTheme.displayLarge),
          Text('Display medium', style: context.textTheme.displayMedium),
          Text('Display small', style: context.textTheme.displaySmall),
          Text('Headline small', style: context.textTheme.headlineLarge),
          Text('Headline medium', style: context.textTheme.headlineMedium),
          Text('Headline large', style: context.textTheme.headlineSmall),
          Text('Title large', style: context.textTheme.titleLarge),
          Text('Title medium', style: context.textTheme.titleMedium),
          Text('Title small', style: context.textTheme.titleSmall),
          Text('Label large', style: context.textTheme.labelLarge),
          Text('Label medium', style: context.textTheme.labelMedium),
          Text('Label small', style: context.textTheme.labelSmall),
          Text('Body large', style: context.textTheme.bodyLarge),
          Text('Body medium', style: context.textTheme.bodyMedium),
          Text('Body small', style: context.textTheme.bodySmall),
        ],
      ),
    );
  }
}
