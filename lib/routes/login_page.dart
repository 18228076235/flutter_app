import 'package:flutter/material.dart';
import 'package:wanandroid_app/common/Http.dart';
import 'package:wanandroid_app/common/ProfileChangeNotifier.dart';
import 'package:wanandroid_app/components/GmLocalizations.dart';
import 'package:wanandroid_app/models/user.dart';
import 'package:provider/provider.dart';

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
        title: Text(gm.getString(Ids.user_name)),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: gm.getString(Ids.user_name),
                    hintText: gm.getString(Ids.user_name),
                    icon: Icon(Icons.person)),
                validator: (v) {
                  return v.trim().length > 0
                      ? null
                      : gm.getString(Ids.user_name);
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: gm.getString(Ids.user_name),
                  hintText: gm.getString(Ids.user_name),
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (v) {
                  return v.trim().length > 5
                      ? null
                      : gm.getString(Ids.user_name);
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 55),
                      child: RaisedButton(
                          child: Text(gm.getString(Ids.user_name)),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: _onLogin),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    if ((_formKey.currentState as FormState).validate()) {
      User user;
      try {
        user = await Http().login(_nameController.text, _pwdController.text);
        print(user);
        Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        print('66666${e}');
        // if (e.response?.statusCode == 401) {}
      } finally {
        Navigator.of(context).pop();
      }
    }
  }
}
