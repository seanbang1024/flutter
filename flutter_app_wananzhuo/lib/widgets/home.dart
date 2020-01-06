import 'package:flutter/material.dart';
import 'package:flutter_app_loan/widgets/help_web.dart';
import 'package:flutter_app_loan/widgets/index.dart';
import 'package:flutter_app_loan/widgets/mine.dart';

class TotalPage extends StatefulWidget {
  @override
  _TotalPageState createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  List<Widget> tabbarList = [Index(), HelpWebs(), MainPage()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabbarList.length, vsync: this)
      ..addListener(() {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index: _selectedIndex,
        children: tabbarList,
      ),
//      TabBarView(controller: _tabController, children: tabbarList),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: (Text('首页'))),
          BottomNavigationBarItem(icon: Icon(Icons.help), title: (Text('帮助'))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: (Text('我的'))),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        fixedColor: Colors.red,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = _selectedIndex;
    });
  }
}
