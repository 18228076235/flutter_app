import 'package:wanandroid_app/Pages/splash_page.dart';
import 'package:wanandroid_app/Pages/login_page.dart';
import 'package:fluro/fluro.dart';

Handler splashPageHandler =
    Handler(handlerFunc: (context, params) => SplashPage());
Handler loginRouteHandler =
    Handler(handlerFunc: (context, params) => LoginRoute());
