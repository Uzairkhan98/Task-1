import 'package:flutter/material.dart';

import 'personal.dart';

import '../../Widgets/topbar.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                        height: 50,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Username'.toUpperCase(),
                            hintStyle: const TextStyle(color: Color(0xffC4C4C4))
                        ),
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
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Email'.toUpperCase(),
                            hintStyle: const TextStyle(color: Color(0xffC4C4C4))
                        ),
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
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Password'.toUpperCase(),
                            hintStyle: const TextStyle(color: Color(0xffC4C4C4))
                        ),
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
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Confirm Password'.toUpperCase(),
                            hintStyle: const TextStyle(color: Color(0xffC4C4C4))
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: ElevatedButton(
                          onPressed: () =>  {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                          return const Personal();
                          }),
                          )
                        },
                          child: Text ('Next'.toUpperCase()),
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff1ba1a5),
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
      ),
    );
  }
}

