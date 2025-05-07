import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onChangeLocale(Locale locale) {
      context.setLocale(locale).then(
            (value) => setState(
              () {},
            ),
          );
    }

    return ScreenUtilInit(
      designSize: const Size(380, 800),
      minTextAdapt: true,
      ensureScreenSize: true,
      fontSizeResolver: (num fontSize, ScreenUtil instance) {
        if (instance.screenWidth > 380 && instance.screenHeight > 800) {
          return fontSize.toDouble();
        } else {
          return fontSize * 0.7;
        }
      },
      builder: (BuildContext context, Widget? child) => LocalizationWidget(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            ...context.localizationDelegates,
          ],
          supportedLocales: context.supportedLocales,
          theme: lightTheme,
          darkTheme: darkTheme,
          locale: context.locale,
          routerConfig: appLocator<AppRouter>().router,
        ),
        onChangeLocale,
      ),
    );
  }
}
