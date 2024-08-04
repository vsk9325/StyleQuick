import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView>  with SingleTickerProviderStateMixin{

  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Demo"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.directions_car),child: Text("Car"),),
            Tab(icon: Icon(Icons.directions_train),child: Text("Train"),),
            Tab(icon: Icon(Icons.directions_bike),child: Text("Bike"),)
          ],
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Tab Car"),),
          Center(child: Text("Tab Train"),),
          Center(child: Text("Tab Bike"),),
        ],
      ),
    );
  }
}
