import 'package:fluro/fluro.dart';
import 'package:wanandroid_app/Router/RoutesHandler.dart';

class Routes {
  static String login = '/login';
  static configureRoutes(Router router) {
    router.define(login, handler: loginHandler);
  }
}
