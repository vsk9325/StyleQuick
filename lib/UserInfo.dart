import 'dart:convert';

import 'package:fitness/UserDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'package:get/get.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  var users = <User>[].obs;
  @override
  void initState() {
    super.initState();
    fetchUser();
  }
  Future<void> fetchUser() async{
    final response = await http.post(Uri.parse("http://192.168.27.240/fitness/fetch.php"));
    if(response.statusCode == 200){
      final List<dynamic> userJson = jsonDecode(response.body);
      users.value = userJson.map((json) => User.fromJson(json)).toList();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx((){
        if(users.isEmpty){
          return Center(child: Text("No Data Available"),);
        }
        return ListView.builder(
          itemCount: users.length,
            itemBuilder:(context,index){
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(users[index].name[0].toUpperCase(),style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                title: Text(users[index].name),
                onTap: (){
                  Get.to(() => UserDetails(user: users[index]));
                },
              ),
            );
            }
        );
      })
    );
  }
}
