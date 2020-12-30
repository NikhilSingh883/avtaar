import 'package:flutter/cupertino.dart';

class Design {
  final title;
  final desc;
  int stagesCompleted;
  bool bookMarked;
  bool locked;
  final String url;

  Design({
    @required this.title,
    @required this.desc,
    @required this.stagesCompleted,
    @required this.bookMarked,
    @required this.locked,
    @required this.url,
  });
}
