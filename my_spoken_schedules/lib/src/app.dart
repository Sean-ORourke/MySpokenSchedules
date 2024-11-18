import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme.dart'; // Import theme.dart
import 'sample_feature/schedule_details_view.dart';
import 'sample_feature/schedule_list_view.dart';
import 'sample_feature/task_details_view.dart';
import 'sample_feature/task_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: AppTheme.lightTheme, // Use light theme
          darkTheme: AppTheme.darkTheme, // Use dark theme
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SchedulesDetailsView.routeName:
                    return const SchedulesDetailsView();
                  case TasksDetailsView.routeName:
                    return const TasksDetailsView();
                  case TaskListView.routeName:
                    return const TaskListView();
                  case ScheduleListView.routeName:
                  default:
                    return const ScheduleListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
