import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../main.dart';

// ignore: must_be_immutable
class Loaders extends StatefulWidget {
  final String? name;

  Loaders({this.name = 'Circle'});

  @override
  _LoadersState createState() => _LoadersState();
}

class _LoadersState extends State<Loaders> {
  // Dynamic color logic
  Color getLoaderColor(String? loaderName) {
    switch (loaderName) {
      case 'RotatingPlane':
        return Colors.blue;
      case 'DoubleBounce':
        return Colors.green;
      case 'Wave':
        return Colors.purple;
      case 'WanderingCubes':
        return Colors.orange;
      case 'Pulse':
        return Colors.red;
      case 'ChasingDots':
        return Colors.teal;
      case 'FadingFour':
        return Colors.amber;
      case 'Circle':
        return Colors.cyan;
      case 'CubeGrid':
        return Colors.indigo;
      case 'FadingCircle':
        return Colors.pink;
      case 'FoldingCube':
        return Colors.lime;
      case 'RotatingCircle':
        return Colors.brown;
      case 'Ring':
        return Colors.deepPurple;
      default:
        return Colors.white; // Default to theme color
    }
  }

  @override
  Widget build(BuildContext context) {
    var name = widget.name;

    Widget child = Container();

    // Use the dynamic color logic
    final loaderColor = getLoaderColor(name);

    if (name == 'RotatingPlane') {
      child = SpinKitRotatingPlain(size: 30.0, color: loaderColor);
    } else if (name == 'DoubleBounce') {
      child = SpinKitDoubleBounce(size: 30.0, color: loaderColor);
    } else if (name == 'Wave') {
      child = SpinKitWave(size: 30.0, color: loaderColor);
    } else if (name == 'WanderingCubes') {
      child = SpinKitWanderingCubes(size: 30.0, color: loaderColor);
    } else if (name == 'Pulse') {
      child = SpinKitPulse(size: 30.0, color: loaderColor);
    } else if (name == 'ChasingDots') {
      child = SpinKitChasingDots(size: 30.0, color: loaderColor);
    } else if (name == 'FadingFour') {
      child = SpinKitFadingFour(size: 30.0, color: loaderColor);
    } else if (name == 'Circle') {
      child = SpinKitCircle(size: 30.0, color: loaderColor);
    } else if (name == 'CubeGrid') {
      child = SpinKitCubeGrid(size: 30.0, color: loaderColor);
    } else if (name == 'FadingCircle') {
      child = SpinKitFadingCircle(size: 30.0, color: loaderColor);
    } else if (name == 'FoldingCube') {
      child = SpinKitFoldingCube(size: 30.0, color: loaderColor);
    } else if (name == 'RotatingCircle') {
      child = SpinKitRotatingCircle(size: 30.0, color: loaderColor);
    } else if (name == 'Ring') {
      child = SpinKitRing(size: 30.0, color: loaderColor);
    }

    return Center(
      child: Container(
        height: 150,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}


