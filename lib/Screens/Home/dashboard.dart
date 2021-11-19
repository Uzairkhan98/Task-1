import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Dashboard extends StatefulWidget {
  final List userData;
  const Dashboard(this.userData);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final formGlobalKey = GlobalKey < FormState > ();

  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController usertypeController = TextEditingController();

  var a;

  @override
  Widget build(BuildContext context) {
    print(widget.userData[1]);
    Map<String, dynamic> temp = widget.userData[0][0];
    print(temp);
    var dat = dataMap.fromJson(temp);
    print('cpoming here');
    print(dat);
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
      Form(
        key: formGlobalKey,
        child: Container(
          color: Colors.white70,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40,0,40,0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      child: const Text('User Details',
                        style: TextStyle(
                          color: Color(0xff1ba1a5),
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                        ),
                      ),
                      onTap: () => {}
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: usernameController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Username: ${dat.username}',
                    ),
                    validator: (email) { },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric( horizontal: 30, vertical: 0),
                    child: Divider(
                      color: Color(0xffC4C4C4),
                      height:25,
                      thickness: 2,
                      indent:5,
                      endIndent: 5,
                    ),
                  ),

                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: fullnameController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Full Name: ${dat.full_name}',
                    ),
                    validator: (email) { },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric( horizontal: 30, vertical: 0),
                    child: Divider(
                      color: Color(0xffC4C4C4),
                      height:25,
                      thickness: 2,
                      indent:5,
                      endIndent: 5,
                    ),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: dobController,
                    enabled: false,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Date of Birth: ${dat.dob}',
                    ),
                    validator: (email) { },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric( horizontal: 30, vertical: 0),
                    child: Divider(
                      color: Color(0xffC4C4C4),
                      height:25,
                      thickness: 2,
                      indent:5,
                      endIndent: 5,
                    ),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: countryController,
                    enabled: false,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Country: ${dat.country}',
                    ),

                    validator: (email) { },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric( horizontal: 30, vertical: 0),
                    child: Divider(
                      color: Color(0xffC4C4C4),
                      height:25,
                      thickness: 2,
                      indent:5,
                      endIndent: 5,
                    ),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: genderController,
                    enabled: false,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Gender: ${dat.gender}',
                    ),
                    validator: (email) { },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric( horizontal: 30, vertical: 0),
                    child: Divider(
                      color: Color(0xffC4C4C4),
                      height:25,
                      thickness: 2,
                      indent:5,
                      endIndent: 5,
                    ),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: usertypeController,
                    enabled: false,
                    decoration: InputDecoration.collapsed(
                      hintText: 'User Type: ${dat.user_type}',
                    ),
                    validator: (email) { },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric( horizontal: 30, vertical: 0),
                    child: Divider(
                      color: Color(0xffC4C4C4),
                      height:25,
                      thickness: 2,
                      indent:5,
                      endIndent: 5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () =>  {
                        print('Pressed button'),
                        updateUser(dat.id, usernameController.text, fullnameController.text,widget.userData[1] )
                      },
                      child: Text ('Update'.toUpperCase()),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff1ba1a5),
                          minimumSize: const Size(150, 40)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () async =>  {
                        a = await deactivateUser(dat.id, widget.userData[1]),
                        print(a),
                        if(a == true){
                          print('Deactivation done'),
                          Navigator.pop(context)
                        }
                        else print('Deactivation unsuccessful')

                    },
                      child: Text ('Deactivate user'.toUpperCase()),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xffff0000),
                          minimumSize: const Size(150, 40)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
        ],
      )
    );
  }
  updateUser(int id, userName, fullName, token ) async {
    print('coming here');
    Map data = {
      'id' : id.toString(),
      'username': userName,
      'full_name': fullName,
    };

    var response = await http.put(Uri.parse("http://localhost:4000/users/update-user"), body: json.encode(data), headers: <String, String>{
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',

    });
    print(response);
    if(response.statusCode == 200) {
      print(response.body);
      return null;
    }
    return null;
  }
  deactivateUser(int id,  token ) async {
    Map data = {
      'id' : id.toString(),
    };

    var response = await http.put(Uri.parse("http://localhost:4000/users/deactivate-user"), body: json.encode(data), headers: <String, String>{
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',

    });
    print(response);
    print('user deactivated');
    if(response.statusCode == 200) {
      print(response.body);
      return true;
    }
    return null;
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
