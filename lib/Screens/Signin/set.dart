import 'package:flutter/material.dart';

class Set extends StatefulWidget {
  const Set({Key? key}) : super(key: key);

  @override
  _SetState createState() => _SetState();
}

class _SetState extends State<Set> {
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
                          child: const Text('Set Password',
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
                      const TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration.collapsed(
                            hintText: 'New Password',
                            hintStyle: TextStyle(color: Color(0xffC4C4C4))
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
                      const TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Color(0xffC4C4C4))
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: ElevatedButton(
                          onPressed: () =>  { },
                          child: Text ('Submit'.toUpperCase()),
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