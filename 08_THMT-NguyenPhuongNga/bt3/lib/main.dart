import 'package:flutter/material.dart';

class ColorChangeButton extends StatefulWidget {
  @override
  _ColorChangeButtonState createState() => _ColorChangeButtonState();
}

class _ColorChangeButtonState extends State<ColorChangeButton> {
  List<Color> _backgroundColors = [
    Colors.blue,
    Colors.pink,
    Colors.yellow,
    Colors.white,
    Colors.orange,
    Colors.green,
  ];
  int _currentColorIndex = 0;

  void _changeBackgroundColor() {
    setState(() {
      _currentColorIndex = (_currentColorIndex + 1) % _backgroundColors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Homework'),
      ),
      backgroundColor: _backgroundColors[_currentColorIndex], 
      body: Center(
        child: ElevatedButton(
          onPressed: _changeBackgroundColor,
          child: Text('Click me to changes background color'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ColorChangeButton(),
  ));
}