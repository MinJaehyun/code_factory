import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  // todo: SingleTickerProviderStateMixin 와 TickerProviderStateMixin 차이는?
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(index) {
      setState(() {
        tabController.index = index;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: [
            // note: HomeScreen
            Container(
              child: Center(child: Text('TAB 1')),
            ),
            // note: SettingScreen
            Container(
              child: Center(child: Text('TAB 2')),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.flutter_dash), label: '주사위'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
        ],
        currentIndex: tabController.index,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
