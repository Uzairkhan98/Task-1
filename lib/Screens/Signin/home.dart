import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../Signup/home.dart';


class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
                        height: 80,
                      ),
                      const TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Username',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric( horizontal: 30, vertical: 0),
                        child: Divider(
                          color: Colors.grey,
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
                          hintText: 'Password',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: const Text ('Login'),
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff1ba1a5),
                              minimumSize: const Size(150, 40)
                          ),
                        ),
                      ),
                      InkWell(
                          child: const Text('Forgot Password?',
                            style: TextStyle(
                              color: Color(0xff1ba1a5),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () => {}
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                          child: const Text('Create Account?',
                            style: TextStyle(
                              color: Color(0xff1ba1a5),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const Signup();
                              }),
                            )
                          },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SignInButton(
                        Buttons.Apple,
                        text: "Sign in with Apple",
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SignInButton(
                        Buttons.FacebookNew,
                        text: "Sign in with Facebook",
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SignInButton(
                        Buttons.GoogleDark,
                        text: "Sign in with Google",
                        onPressed: () {},
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

