import 'package:avtaar/presentation/models/design.dart';
import 'package:avtaar/presentation/widgets/design_tile.dart';
import 'package:avtaar/provider/designProvider.dart';
import 'package:avtaar/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesignPage extends StatefulWidget {
  @override
  _DesignPageState createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  Widget build(BuildContext context) {
    final List<Design> designs =
        Provider.of<DesignProvider>(context).getDesigns;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier * 3,
        vertical: SizeConfig.heightMultiplier * 3,
      ),
      child: Container(
        child: ListView.builder(
          itemCount: designs.length,
          itemBuilder: (context, idx) {
            return DesignTile(designs[idx], idx);
          },
        ),
      ),
    );
  }
}
