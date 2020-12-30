import 'package:avtaar/presentation/models/design.dart';
import 'package:flutter/cupertino.dart';

class DesignProvider with ChangeNotifier {
  List<Design> _design = [
    Design(
      title: 'UI',
      desc: 'Visual appearence of app sjd',
      stagesCompleted: 2,
      bookMarked: false,
      locked: false,
      url: 'assets/images/ui_design.png',
    ),
    Design(
      title: 'UX',
      desc: 'Brain behind the design',
      stagesCompleted: 2,
      bookMarked: true,
      locked: false,
      url: 'assets/images/ux_design.jpg',
    ),
    Design(
      title: 'Interaction',
      desc: 'Includes animations and effects',
      stagesCompleted: 1,
      bookMarked: true,
      locked: false,
      url: 'assets/images/int_design.jpg',
    ),
    Design(
      title: 'Industrial',
      desc: 'Visual appearence of app and indutrial knowledge',
      stagesCompleted: 0,
      bookMarked: true,
      locked: false,
      url: 'assets/images/ind_design.jpg',
    ),
  ];

  List<Design> get getDesigns {
    return _design;
  }

  toggelBook(int idx) {
    _design.elementAt(idx).bookMarked = !_design.elementAt(idx).bookMarked;
    notifyListeners();
  }

  toggleLock(int idx) {
    _design.elementAt(idx).locked = !_design.elementAt(idx).locked;
    notifyListeners();
  }
}
