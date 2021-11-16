import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() =>
      
      _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String serverResponse = 'Server response';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
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
                          child: const Text('Dashboard',
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
                      ElevatedButton(
                        child: const Text('Send request to server'),
                        onPressed: () {
                          _makeGetRequest();
                        },
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
  _makeGetRequest() async {
    final url = Uri.parse('http://localhost:4000/users/user-profile/johndoe@gmail.com');
    Response response = await get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    'Access-Control-Allow-Origin':'true',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiam9obmRvZUBnbWFpbC5jb20iLCJpYXQiOjE2MzcwNTUzMzEsImV4cCI6MTYzNzA1ODkzMX0.Nb9FgwZyNKi1MzL8JRG5mr5Gm4tHwm34WTPvm3PDxik',
    });
    print(response.body);
    setState(() {
      serverResponse = response.body;
    });
  }


}
