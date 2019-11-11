import 'package:flutter/material.dart';

class Utils {
  static getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static showSnackBar(BuildContext context, String msg) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('$msg'),
      ),
    );
  }
}
