import 'package:flutter/material.dart';
import 'package:wanandroid_app/components/GmLocalizations.dart';
import 'package:wanandroid_app/widgets/login_background.dart';
import 'package:wanandroid_app/widgets/login_item.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[LoginBackground(), Loginbody()],
      ),
    );
  }
}

class Loginbody extends StatelessWidget {
  const Loginbody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _pwdController = TextEditingController();
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                LoginItem(
                  controller: _nameController,
                  autofocus: true,
                  labelText:
                      GmLocalizations.of(context).getString(Ids.user_name),
                  prefixIcon: Icons.person,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
