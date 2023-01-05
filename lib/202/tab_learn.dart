import 'package:flutter/material.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 4;
  final double _bottomTabBarPadding = 4;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // length: 2,
        length: _MyTabViews.values.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: _myTabView(),
          ),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // _tabController.animateTo(0);
              _tabController.animateTo(_MyTabViews.home.index);
            },
          ),
          bottomNavigationBar: BottomAppBar(
            // notchMargin: 10,
            notchMargin: _notchedValue,
            // shape: const CircularNotchedRectangle(),
            color: Colors.black,
            child: TabBar(
              padding: EdgeInsets.only(top: _bottomTabBarPadding),
              // isScrollable: true,
              controller: _tabController,
              // tabs: const [
              //   Tab(text: 'Page1'),
              //   Tab(text: 'Page2'),
              // ],
              tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
            ),
          ),
          body: _tabBarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
      // labelColor: Colors.red,
      // unselectedLabelColor: Colors.green,
      padding: EdgeInsets.zero,
      indicatorColor: Colors.white,
      controller: _tabController,
      // tabs: const [
      //   Tab(text: 'Page1'),
      //   Tab(text: 'Page2'),
      // ],
      tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
        ]);
  }
}

enum _MyTabViews {
  home,
  settings,
  favorite,
  profile,
}

extension _MyTabViewExtension on _MyTabViews {}
