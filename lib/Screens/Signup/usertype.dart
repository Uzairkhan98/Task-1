import 'package:flutter/material.dart';

class Type extends StatefulWidget {
  const Type({Key? key}) : super(key: key);

  @override
  _TypeState createState() => _TypeState();
}

class _TypeState extends State<Type> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 45,
            child: Container(
              color: const Color(0xff1ba1a5),
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
              child: SafeArea(
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 55,
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
                            hintText: 'User Type'.toUpperCase(),
                            hintStyle: const TextStyle(color: Color(0xffC4C4C4))
                        ),
                      ),
                      const Text(
                        'User Type',
                        style: TextStyle(color: Color(0xffC4C4C4),
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
                            hintText: 'Date of Birth'.toUpperCase(),
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
                            hintText: 'Country'.toUpperCase(),
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
                            hintText: 'Gender'.toUpperCase(),
                            hintStyle: const TextStyle(color: Color(0xffC4C4C4))
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: ElevatedButton(
                          onPressed: () => {},
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
