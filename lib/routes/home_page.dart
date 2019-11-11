import 'package:flutter/material.dart';
import 'package:wanandroid_app/common/Http.dart';
import 'package:wanandroid_app/common/ProfileChangeNotifier.dart';
import 'package:wanandroid_app/components/GmLocalizations.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid_app/models/repo.dart';
import 'package:wanandroid_app/widgets/home_page_list.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key}) : super(key: key);

  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context).getString(Ids.titleHome)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    print(userModel.isLogin);
    if (!userModel.isLogin) {
      return Center(
        child: RaisedButton(
          child: Text(GmLocalizations.of(context).getString(Ids.titleHome)),
          onPressed: () => Navigator.of(context).pushNamed('login'),
        ),
      );
    } else {
      return HomeList();
    }
  }
}
