import 'package:flutter/material.dart';

import '../../Widgets/topbar.dart';

class Type extends StatefulWidget {

  final formGlobalKey = GlobalKey < FormState > ();

  final String userName;
  final String password;
  final String email;
  final String fullName;
  final String dob;
  final String country;
  final int gender;

  Type(this.userName, this.password, this.email, this.fullName, this.dob, this.country, this.gender);

  @override
  _TypeState createState() => _TypeState();
}

class _TypeState extends State<Type> {

  String _value = '';

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
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Toggle light when tapped.
                                      _value = 'Student';
                                    });
                                  },

                                  child:  const CircleAvatar(
                                    radius: 55.0,
                                    backgroundImage: ExactAssetImage('assets/student.png'),
                                  ),
                                ),
                                const SizedBox(height:20),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Toggle light when tapped.
                                      _value = 'Professional';
                                    });
                                  },
                                  child:  const CircleAvatar(
                                    radius: 55.0,
                                    backgroundImage: ExactAssetImage('assets/student.png'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width:20),
                            Column(
                              children: [
                                const SizedBox(height:20),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Toggle light when tapped.
                                      _value = 'Businessman';
                                    });
                                  },
                                  child:  const CircleAvatar(
                                    radius: 55.0,
                                    backgroundImage: ExactAssetImage('assets/student.png'),
                                  ),
                                ),
                                const SizedBox(height:20),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Toggle light when tapped.
                                      _value = 'Others';
                                    });
                                  },
                                  child:  const CircleAvatar(
                                    radius: 55.0,
                                    backgroundImage: ExactAssetImage('assets/student.png'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: ElevatedButton(
                  onPressed: () =>  { print(_value) },
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
}
