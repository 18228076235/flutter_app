import 'package:flutter/material.dart';
import 'package:wanandroid_app/common/Http.dart';
import 'package:wanandroid_app/common/ProfileChangeNotifier.dart';
import 'package:wanandroid_app/components/GmLocalizations.dart';
import 'package:wanandroid_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid_app/widgets/login_item.dart';

class LoginRoute extends StatefulWidget {
  LoginRoute({Key key}) : super(key: key);

  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              LoginItem(
                controller: _nameController,
                prefixIcon: Icons.phone,
                autofocus: true,
                labelText: gm.getString(Ids.user_name),
              ),
              LoginItem(
                controller: _pwdController,
                prefixIcon: Icons.lock,
                labelText: gm.getString(Ids.user_pwd),
                hasSuffixIcon: true,
              ),
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 55),
                      child: RaisedButton(
                        child: Text(
                          gm.getString(Ids.user_login),
                          style: TextStyle(fontSize: 16),
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: _onLogin,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(55))),
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    HttpUtil().get('/login/cellphone',
        data: {'phone': '', 'password': ''}).then((res) {
      print(res);
    });
  }
}
