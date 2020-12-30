import 'package:avtaar/presentation/models/design.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = '/detail';
  final Design design;
  DetailScreen(this.design);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          design.title,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
