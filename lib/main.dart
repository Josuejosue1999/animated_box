import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Animated Box By Josué Biaou'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBox1(),
              SizedBox(height: 20),
              AnimatedBox2(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedBox1 extends StatefulWidget {
  @override
  _AnimatedBox1State createState() => _AnimatedBox1State();
}

class _AnimatedBox1State extends State<AnimatedBox1> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _toggleSize();
  }

  void _toggleSize() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isExpanded = !_isExpanded;
      });
      _toggleSize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _isExpanded ? 200 : 100,
      height: _isExpanded ? 200 : 100,
      color: _isExpanded ? Colors.blue : Colors.red,
      alignment: _isExpanded ? Alignment.center : AlignmentDirectional.topCenter,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      child: Text(
        'Josué',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

class AnimatedBox2 extends StatefulWidget {
  @override
  _AnimatedBox2State createState() => _AnimatedBox2State();
}

class _AnimatedBox2State extends State<AnimatedBox2> {
  bool _isRotated = false;

  @override
  void initState() {
    super.initState();
    _toggleRotation();
  }

  void _toggleRotation() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isRotated = !_isRotated;
      });
      _toggleRotation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 150,
      height: 150,
      color: Colors.green,
      alignment: Alignment.center,
      duration: Duration(seconds: 1),
      transform: Matrix4.rotationZ(_isRotated ? 0.0 : 0.5),
      child: Text(
        'Biaou',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
