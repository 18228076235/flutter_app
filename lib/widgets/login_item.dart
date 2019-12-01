import 'package:flutter/material.dart';
import 'package:wanandroid_app/style/colors.dart';

class LoginItem extends StatefulWidget {
  @override
  const LoginItem(
      {Key key,
      this.prefixIcon,
      @required this.controller,
      this.autofocus = false,
      this.labelText = '',
      this.hasSuffixIcon = false})
      : super(key: key);
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool autofocus;
  final String labelText;
  final bool hasSuffixIcon;
  _LoginItemState createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  bool _obscureText = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.setState(() {
      _obscureText = widget.hasSuffixIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: TextField(
          controller: widget.controller,
          autofocus: widget.autofocus,
          decoration: InputDecoration(
              prefixIcon:
                  Icon(widget.prefixIcon, size: 28, color: Colours.gray_99),
              hintText: widget.labelText,
              hintStyle: TextStyle(color: Colours.gray_66, fontSize: 14),
              suffixIcon: widget.hasSuffixIcon
                  ? IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      iconSize: 16,
                      color: Colours.gray_66,
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null),
          obscureText: _obscureText,
        ),
      ),
    );
  }
}
