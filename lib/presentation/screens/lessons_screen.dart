import 'package:avtaar/presentation/pages/design_page.dart';
import 'package:avtaar/size_config.dart';
import 'package:avtaar/theme.dart';
import 'package:flutter/material.dart';

class LessonsScreen extends StatefulWidget {
  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  List<Widget> list = [
    Tab(
      child: FittedBox(
        child: Text('Design'),
      ),
    ),
    Tab(
      child: FittedBox(
        child: Text('Environment'),
      ),
    ),
    Tab(
      child: FittedBox(
        child: Text('Technology'),
      ),
    ),
    Tab(
      child: FittedBox(
        child: Text('Research'),
      ),
    ),
    Tab(
      child: FittedBox(
        child: Text('Practicals'),
      ),
    ),
    Tab(
      child: FittedBox(
        child: Text('About'),
      ),
    ),
  ];

  List<Widget> views = [];
  @override
  void initState() {
    _tabController = TabController(length: list.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/points.png',
            ),
            radius: SizeConfig.widthMultiplier * 3,
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier,
          )
        ],
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Lessons',
            style: AppTheme.textTheme.headline6,
          ),
        ),
        // toolbarHeight: SizeConfig.heightMultiplier * 10,

        bottom: TabBar(
          isScrollable: true,
          indicatorWeight: 3,
          // indicator: BoxDecoration(
          //   color: Colors.purple,
          // ),
          indicatorColor: Colors.purple,
          indicatorPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 6.5),
          controller: _tabController,
          unselectedLabelStyle: AppTheme.unselectedTab,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          labelStyle: AppTheme.selectedTab,
          tabs: list,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          DesignPage(),
          DesignPage(),
          DesignPage(),
          DesignPage(),
          DesignPage(),
          DesignPage(),
        ],
      ),
    );
  }
}
