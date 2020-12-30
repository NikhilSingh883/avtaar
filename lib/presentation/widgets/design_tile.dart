import 'package:avtaar/presentation/models/design.dart';
import 'package:avtaar/presentation/screens/detail_screen.dart';
import 'package:avtaar/presentation/widgets/bar.dart';
import 'package:avtaar/provider/designProvider.dart';
import 'package:avtaar/size_config.dart';
import 'package:avtaar/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DesignTile extends StatelessWidget {
  final Design design;
  final int idx;
  DesignTile(this.design, this.idx);

  Function tb;
  Function tl;

  Widget preogressIndicator() {
    List<Widget> progress = [];
    for (int i = 1; i < 4; i++) {
      if (design.stagesCompleted >= i)
        progress.add(Bar(true));
      else
        progress.add(Bar(false));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: progress,
    );
  }

  @override
  Widget build(BuildContext context) {
    tb = Provider.of<DesignProvider>(context, listen: false).toggelBook;
    tl = Provider.of<DesignProvider>(context, listen: false).toggleLock;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) {
              return DetailScreen(design);
            }));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.widthMultiplier * 5),
            ),
            elevation: 6,
            child: Container(
              height: SizeConfig.heightMultiplier * 10,
              width: SizeConfig.widthMultiplier * 78,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 3,
                vertical: SizeConfig.heightMultiplier * 2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            right: SizeConfig.widthMultiplier * 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.widthMultiplier * 2),
                          child: Image(
                            height: SizeConfig.heightMultiplier * 8,
                            width: SizeConfig.widthMultiplier * 15,
                            image: AssetImage(design.url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: SizeConfig.heightMultiplier,
                          ),
                          Container(
                            width: SizeConfig.widthMultiplier * 50,
                            child: Text(
                              '${design.title} Design',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppTheme.textTheme.title,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 2,
                          ),
                          Container(
                            width: SizeConfig.widthMultiplier * 50,
                            child: Text('${design.desc} ',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppTheme.subtitle),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          tb(idx);
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Icon(
                            design.bookMarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            size: SizeConfig.heightMultiplier * 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  preogressIndicator(),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            tl(idx);
          },
          child: Container(
            alignment: Alignment.topCenter,
            child: Icon(
              design.locked ? FontAwesomeIcons.lock : FontAwesomeIcons.unlock,
              size: SizeConfig.heightMultiplier * 3,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
