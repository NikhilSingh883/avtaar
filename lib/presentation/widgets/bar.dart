import 'package:avtaar/size_config.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final bool done;
  Bar(this.done);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          color: done ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier),
        ),
        width: SizeConfig.widthMultiplier * 23,
        height: SizeConfig.heightMultiplier / 2,
      ),
    );
  }
}
