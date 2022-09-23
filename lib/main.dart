import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/l10n/l10n.dart';
import 'package:todo_app/provider/locale_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/view/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox("listItems");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => TodoProvider(),
      ),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => LocaleProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      locale: localeProvider.locale,
      title: 'Flutter Demo',
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: const HomeScreen(),
    );
  }
}
