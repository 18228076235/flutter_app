import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_app/Router/index.dart';
import 'package:wanandroid_app/common/Global.dart';
import 'package:wanandroid_app/components/GmLocalizations.dart';
import 'package:wanandroid_app/components/GmLocalizationsDelegate.dart';
import 'package:wanandroid_app/routes/home_page.dart';
import 'package:wanandroid_app/routes/login_page.dart';
import 'package:wanandroid_app/style/colors.dart';
import 'common/ProfileChangeNotifier.dart';
import 'package:wanandroid_app/common/Global.dart';
import 'package:wanandroid_app/common/ProfileChangeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());
// void main() => Global.init().then((e) => runApp(MyApp())).catchError((onError) {
//       print(onError);
//     });

class MyApp extends StatelessWidget {
  Color _themeColor = Colours.app_main;
  // This widget is the root of your application.
  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Global.router = router;
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, Widget child) {
          return MaterialApp(
              theme: ThemeData.light().copyWith(
                  primaryColor: _themeColor,
                  accentColor: _themeColor,
                  indicatorColor: Colors.white),
              onGenerateTitle: (context) {
                return GmLocalizations.of(context).getString(Ids.user_name);
              },
              home: HomeRoute(), //应用主页
              locale: localeModel.getLocale(),
              //我们只支持美国英语和中文简体
              supportedLocales: [
                const Locale('en', 'US'), // 美国英语
                const Locale('zh', 'CN'), // 中文简体
                //其它Locales
              ],
              localizationsDelegates: [
                // 本地化的代理类
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GmLocalizationsDelegate()
              ],
              localeResolutionCallback:
                  (Locale _locale, Iterable<Locale> supportedLocales) {
                if (localeModel.getLocale() != null) {
                  //如果已经选定语言，则不跟随系统
                  return localeModel.getLocale();
                } else {
                  Locale locale;
                  //APP语言跟随系统语言，如果系统语言不是中文简体或美国英语，
                  //则默认使用美国英语
                  if (supportedLocales.contains(_locale)) {
                    locale = _locale;
                  } else {
                    locale = Locale('en', 'US');
                  }
                  return locale;
                }
              },
              onGenerateRoute: Global.router.generator);
        },
      ),
    );
  }
}
