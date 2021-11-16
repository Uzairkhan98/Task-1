import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';


class Dashboard extends StatefulWidget {
  final List userData;
  const Dashboard(this.userData);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    print('coming here');
    Map<String, dynamic> temp = widget.userData[0];
    var dat = dataMap.fromJson(temp);
    print('cpoming here');
    print(dat);
    return Scaffold(
      body: ListView.builder(
      itemCount: widget.userData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(dat.created_at),
          // When a user taps the ListTile, navigate to the DetailScreen.
          // Notice that you're not only creating a DetailScreen, you're
          // also passing the current todo through to it.

        );
      },
    ),
    );
  }
}

class dataMap {
  final int id;
  final String username;
  final String password;
  final String full_name;
  final String dob;
  final String country;
  final int gender;
  final String user_type;
  final int status;
  final String created_at;
  final String updated_at;

  dataMap(this.id, this.username, this.password, this.full_name, this.dob, this.country, this.gender, this.user_type, this.status, this.created_at, this.updated_at );

  dataMap.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        password = json['password'],
        full_name = json['full_name'],
        dob = json['dob'],
        country = json['country'],
        gender = json['gender'],
        user_type = json['user_type'],
        status = json['status'],
        created_at = json['created_at'],
        updated_at = json['updated_at'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'password' : password,
    'full_name' : full_name,
    'dob' : dob,
    'country': country,
    'gender' : gender,
    'user_type' : user_type,
    'status' : status,
    'created_at' : created_at,
    'updated_at' : updated_at
  };
}
