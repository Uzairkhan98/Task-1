import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.cyan,
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 60),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.white70,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40,0,40,0),
                  child: Column(
                    children: <Widget>[
                      const Text('Username'),
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
                      const Text('Password'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: ElevatedButton(onPressed: () => {}, child: const Text ('Login')),
                      ),
                      InkWell(
                        child: const Text('Forgot Password?'),
                        onTap: () => {}
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                          child: const Text('Create Account'),
                          onTap: () => {}
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


