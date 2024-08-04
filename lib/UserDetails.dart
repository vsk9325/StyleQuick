import 'package:flutter/material.dart';
import 'User.dart';

class UserDetails extends StatelessWidget {

  final User user;
  UserDetails({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Text('Name : ${user.name}'),
          Text('Email: ${user.email}'),
          Text('Contact: ${user.phone}'),
          Text('Address: ${user.address}'),
          Text('Birth Date : ${user.bday}'),
        ],
      ),
    );
  }
}
