import 'package:fluro/fluro.dart';
import 'package:wanandroid_app/Router/RoutesHandler.dart';

class Routes {
  static String splashPage = '/';
  static String login = '/login';
  static configureRoutes(Router router) {
    router.define(splashPage, handler: splashPageHandler);
    router.define(login, handler: loginRouteHandler);
  }
}
