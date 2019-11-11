import 'package:flutter/cupertino.dart';
import 'package:wanandroid_app/utils/index.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatefulWidget {
  @override
  _LoginBackgroundState createState() => _LoginBackgroundState();
}

class _LoginBackgroundState extends State<LoginBackground>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  Animation<double> waveAnimation;
  AnimationController _controller;
  Duration _duration = const Duration(seconds: 10);
  double _value = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);

    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animation.removeListener(_handleProgressChange);
    //     _controller.reset();
    //   }
    // });
    _animation =
        new Tween(begin: _value, end: double.infinity).animate(_controller);
    _animation.addListener(_handleProgressChange);
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(
          size: Size(double.infinity, MediaQuery.of(context).size.height / 2),
          painter: LoginBackgroundPainter(value: _value),
        ),
        Image.asset(
          Utils.getImgPath('ic_launcher_news'),
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          color: Colors.deepPurpleAccent,
        )
      ],
    );
  }

  void _handleProgressChange() {
    setState(() {
      _value = _controller.value;
    });
  }
}

class LoginBackgroundPainter extends CustomPainter {
  final value;
  LoginBackgroundPainter({Key key, @required this.value});

  @override
  double _width;
  double _height;
  final Gradient linearGradient = LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: [Color(0xFF651FFF), Color(0xFFB39DDB)]);
  @override
  void paint(Canvas canvas, Size size) {
    _width = size.width;
    _height = size.height;
    initBackgroundPaint(canvas);
    initAvctor(canvas);
    drawWave(canvas, _height * 0.7, value * 0.9, 0.3, 0.4);
    drawWave(canvas, _height * 0.7, value * 1.2, 0.2, 0.2);
    drawWave(canvas, _height * 0.6, value * 0.8, 0.1, 0.3);
    drawWave(canvas, _height * 0.8, value, 0.4, 0.18);
  }

  void initBackgroundPaint(Canvas canvas) {
    Path _path = Path();
    Paint _paint = Paint()
      ..shader =
          linearGradient.createShader(Rect.fromLTWH(0, 0, _width, _height));
    _path.lineTo(0, _height * 0.6);
    _path.quadraticBezierTo(0, _height * 0.8, _width * 0.2, _height * 0.8);
    _path.lineTo(_width * 0.8, _height * 0.8);
    _path.quadraticBezierTo(_width * 0.9, _height * 0.8, _width, _height * 0.9);
    _path.lineTo(_width, 0);
    canvas.clipPath(_path);
    _path.close();
    canvas.drawPath(_path, _paint);
  }

  void drawWave(Canvas canvas, double radius, double waveOffsetPercent,
      double opacity, double percent) {
    Paint _paint = Paint()..color = Color(0xFF651FFF).withOpacity(opacity);
    double waveOffset = -(waveOffsetPercent * radius * 2);
    double waveProgressHeightY = (1 - 0.5) * radius * 2;
    Offset point1 = Offset(waveOffset, waveProgressHeightY);
    Offset point2 = Offset(waveOffset + radius, waveProgressHeightY);
    Offset point3 = Offset(waveOffset + radius * 2, waveProgressHeightY);
    Offset point4 = Offset(waveOffset + radius * 3, waveProgressHeightY);
    Offset point5 = Offset(waveOffset + radius * 4, waveProgressHeightY);
    Offset point6 = Offset(point5.dx, radius * 2 + _height * percent);
    Offset point7 = Offset(point1.dx, radius * 2 + _height * percent);
    Offset controlPoint1 = Offset(
        waveOffset + radius * 0.5, waveProgressHeightY - _height * percent);
    Offset controlPoint2 = Offset(
        waveOffset + radius * 1.5, waveProgressHeightY + _height * percent);
    Offset controlPoint3 = Offset(
        waveOffset + radius * 2.5, waveProgressHeightY - _height * percent);
    Offset controlPoint4 = Offset(
        waveOffset + radius * 3.5, waveProgressHeightY + _height * percent);

    Path _path = Path()
      ..moveTo(point1.dx, point1.dy)
      ..quadraticBezierTo(
          controlPoint1.dx, controlPoint1.dy, point2.dx, point2.dy)
      ..quadraticBezierTo(
          controlPoint2.dx, controlPoint2.dy, point3.dx, point3.dy)
      ..quadraticBezierTo(
          controlPoint3.dx, controlPoint3.dy, point4.dx, point4.dy)
      ..quadraticBezierTo(
          controlPoint4.dx, controlPoint4.dy, point5.dx, point5.dy)
      ..lineTo(point6.dx, point6.dy)
      ..lineTo(point7.dx, point7.dy)
      ..close();
    canvas.drawPath(_path, _paint);
  }

  void initAvctor(Canvas canvas) {
    final double _radiusWidth = 50;
    final Color _backgroundColor = Colors.white;

    Paint _paint = Paint();
    _paint..color = _backgroundColor.withOpacity(0.1);
    canvas.drawCircle(
        Offset(_width * 0.5, _height * 0.3), _radiusWidth, _paint);
    _paint..color = _backgroundColor.withOpacity(0.2);
    canvas.drawCircle(
        Offset(_width * 0.5, _height * 0.3), _radiusWidth * 0.9, _paint);
    _paint..color = _backgroundColor;
    canvas.drawCircle(
        Offset(_width * 0.5, _height * 0.3), _radiusWidth * 0.8, _paint);
  }

  @override
  bool shouldRepaint(LoginBackgroundPainter oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool shouldRebuildSemantics(LoginBackgroundPainter oldDelegate) => false;
}
