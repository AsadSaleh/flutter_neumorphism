import 'package:flutter/material.dart';

class NeuCircularButton extends StatefulWidget {
  NeuCircularButton(
      {@required this.onTap, @required this.child, this.radius});
  final VoidCallback onTap;
  final double radius;
  final Widget child;

  @override
  _NeuCircularButtonState createState() => _NeuCircularButtonState();
}

class _NeuCircularButtonState extends State<NeuCircularButton> {
  static Color _lightShadow = Colors.grey[300];
  static Color _darkShadow = Colors.grey;

  static List<Color> _fill = <Color>[
    Colors.grey[400],
    Colors.grey[400],
    Colors.grey[400],
  ];

  static List<Color> _inside = <Color>[
    _darkShadow,
    Colors.grey[400],
    _lightShadow,
  ];

  Color _top = _lightShadow;
  Color _bottom = _darkShadow;

  List<Color> _currentFill = _fill;

  void _toggle() {
    print("Switching");
    if (_top == _lightShadow && _bottom == _darkShadow) {
      //down position
      _top = Colors.transparent;
      _bottom = Colors.transparent;
      _currentFill = _inside;
    } else if (_top == Colors.transparent && _bottom == Colors.transparent) {
      //up position
      _top = _lightShadow;
      _bottom = _darkShadow;
      _currentFill = _fill;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _toggle();
              });
            },
            child: Container(
              height: widget.radius / 2,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: _currentFill,
                      stops: [0.2, 0.5, 1]),
                  boxShadow: [
                    BoxShadow(
                        color: _top,
                        offset: Offset(-10, -10),
                        blurRadius: 15,
                        spreadRadius: 0.1),
                    BoxShadow(
                        color: _bottom,
                        offset: Offset(10, 10),
                        blurRadius: 15,
                        spreadRadius: 0.1),
                  ]),
              child: Center(
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}