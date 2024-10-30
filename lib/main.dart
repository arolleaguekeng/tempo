import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'l10n/l10n.dart';
import 'services/api_service.dart';
import 'theme/theme_constants.dart';
import 'theme/theme_manager.dart';
import 'utils/providers/local_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  api_services.setApiRoute(isLocal: false);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeManager(),
      ),
      ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
      ),
    ],
    builder: (context, _) {
      final localeProvider = Provider.of<LocaleProvider>(context);
      final themeProvider = Provider.of<ThemeManager>(context);

      return MaterialApp(
        locale: localeProvider.locale,
        title: "Tempo",
        themeMode: themeProvider.themeMode,
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: <String, WidgetBuilder>{
          MyApp.routeName: (_) => MyApp(),
        },
        debugShowCheckedModeBanner: false,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      );
    },
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static String currentLanguage = "en";
  static const String routeName = '/';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
