import 'package:flutter/material.dart';

import '../../Widgets/topbar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
class Type extends StatefulWidget {

  final formGlobalKey = GlobalKey < FormState > ();

  final String userName;
  final String password;
  final String email;
  final String fullName;
  final String dob;
  final String country;
  final int gender;

  Type(this.userName, this.password, this.email, this.fullName, this.dob, this.country, this.gender, {Key? key}) : super(key: key);

  @override
  _TypeState createState() => _TypeState();
}

class _TypeState extends State<Type> {

  String _value = '';
  var _color1 = const Color(0xffffffff);
  var _color2 = const Color(0xffffffff);
  var _color3 = const Color(0xffffffff);
  var _color4 = const Color(0xffffffff);

  var a;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          const expansionWidget(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 75,
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
                          child: const Text('Sign Up',
                            style: TextStyle(
                              color: Color(0xff1ba1a5),
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                            ),
                          ),
                          onTap: () => {}
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('User type', textAlign: TextAlign.center, style: TextStyle(color:Color(0xffC4C4C4), fontSize: 18),),
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
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height:20),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 5.0,
                                      // assign the color to the border color
                                      color: _color1,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // Toggle light when tapped.
                                        _value = 'Student';
                                        _color1 = const Color(0xff1ba1a5);
                                        _color2 = Colors.white;
                                        _color3 = Colors.white;
                                        _color4 = Colors.white;
                                      });
                                    },

                                    child:  const CircleAvatar(
                                      radius: 55.0,
                                      backgroundImage: ExactAssetImage('assets/student.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(height:20),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 5.0,
                                      // assign the color to the border color
                                      color: _color2,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // Toggle light when tapped.
                                        _value = 'Professional';
                                        _color1 = Colors.white;
                                        _color2 = const Color(0xff1ba1a5);
                                        _color3 = Colors.white;
                                        _color4 = Colors.white;
                                      });
                                    },
                                    child:  const CircleAvatar(
                                      radius: 55.0,
                                      backgroundImage: ExactAssetImage('assets/professionals.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width:20),
                            Column(
                              children: [
                                const SizedBox(height:20),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 5.0,
                                      // assign the color to the border color
                                      color: _color3,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // Toggle light when tapped.
                                        _value = 'Businessman';
                                        _color1 = Colors.white;
                                        _color2 = Colors.white;
                                        _color3 = const Color(0xff1ba1a5);
                                        _color4 = Colors.white;
                                      });
                                    },
                                    child:  const CircleAvatar(
                                      radius: 55.0,
                                      backgroundImage: ExactAssetImage('assets/business.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(height:20),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 5.0,
                                      // assign the color to the border color
                                      color: _color4,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // Toggle light when tapped.
                                        _value = 'Others';
                                        _color1 = Colors.white;
                                        _color2 = Colors.white;
                                        _color3 = Colors.white;
                                        _color4 = const Color(0xff1ba1a5);
                                      });
                                    },
                                    child:  const CircleAvatar(
                                      radius: 55.0,
                                      backgroundImage: ExactAssetImage('assets/others.png'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: ElevatedButton(
                  onPressed: ()  async =>  {
                    a = await registerUser(widget.userName, widget.email, widget.password, widget.fullName, widget.dob, widget.gender, widget.country, _value),
                    if(a == true) {
                      Navigator.of(context).popUntil((route) => route.isFirst)
                    }
                    else {print('Registration unsuccessful')}
                  },
                  child: Text ('Next'.toUpperCase()),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff1ba1a5),
                      minimumSize: const Size(150, 40)
                  ),
                ),
              ),
                      ],
                    )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  registerUser(String userName, email, password, fullName, dob, gender, country, user_type ) async {

    Map data = {
      'username': userName,
      'email': email,
      'password': password,
      'full_name': fullName,
      'dob' : dob,
      'gender' : gender,
      'country' : country,
      'user_type' : user_type
    };

    var response = await http.post(Uri.parse("http://10.0.2.2:4000/users/register"), body: json.encode(data), headers: <String, String>{
      'Content-type' : 'application/json; charset=UTF-8'
    });
    print(response);
    if(response.statusCode == 200) {
      print(response.body);
      return true;
    }
    return null;
  }
}
