import 'package:fitness/PageFragment1.dart';
import 'package:fitness/TabView.dart';
import 'package:fitness/UserInfo.dart';
import 'package:fitness/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        backgroundColor: Colors.pink,
      ),
      drawer: _buildDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Welcome to HomePage" , style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            ElevatedButton(
                onPressed: (){
                  Get.to(UserInfo());
                },
                child: Text("Show Data",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),)
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                  Get.to(()=> TabView());
                },
                child: Text("Tabs",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),)
            ),
          ],
        ),
      ),

    );
  }
}

Widget _buildDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Text("Drawer Header",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: (){
            Get.to(PageFragment());
            //Navigator.pop(context); not to use this
          },
        ),
        ListTile(
          leading: Icon(Icons.account_box_outlined),
          title: Text("About"),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text("Contact"),
          onTap: (){
            Navigator.pop(context);
          },
        )
      ],
    ),
  );
}

