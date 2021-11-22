import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../Signup/home.dart';
import '../Home/dashboard.dart';
import 'reset.dart';
import '../../Widgets/topbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Mixins/inputvalidation.dart';


class Signin extends StatefulWidget{
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin>  with InputValidationMixin{
  final formGlobalKey = GlobalKey < FormState > ();

  dynamic serveres;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:const Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formGlobalKey,
        child: Column(
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
                          height: 80,
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          controller: emailController,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Email',
                          ),
                          validator: (email) {
                            if (isEmailValid(email!)) {
                              return null;
                            } else {
                              return 'Enter a valid email address';
                            }
                          },
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
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Password',
                          ),

                          validator: (password) {
                            if (isPasswordValid(password!)) {
                              return null;
                            } else {
                              return 'Enter a valid password';
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          child: ElevatedButton(
                            onPressed: () async => {
                              showLoaderDialog(context),
                              serveres = await signIn(emailController.text, passwordController.text),
                              print(serveres),
                              Navigator.pop(context),
                              if(serveres != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return Dashboard(serveres);
                                  }),
                                ),
                              },
                            if (formGlobalKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                            print("Form is valid")
                        }
                            },
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
                            onTap: () async => {

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  print(emailController.text);
                                  print(passwordController.text);
                                  return const Reset();
                                }),
                              )
                            },
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
      ),
    );
  }
  signIn(String email, pass) async {

    Map data = {
      'email': email,
      'password': pass
    };
    http.Response res;
    var response = await http.post(Uri.parse("http://10.0.2.2:4000/users/login"), body: json.encode(data), headers: <String, String>{
    'Content-type' : 'application/json; charset=UTF-8'
    });
    if(response.statusCode == 200) {
      Map<String, dynamic> postResmap = jsonDecode(response.body);
      var tok = postRes.fromJson(postResmap);
      var lab = postRess.fromJson(jsonDecode(jsonEncode(tok.data)));
      print(lab.id);
      // Object postRessmap = tok.data;

      // var lab = postRess.fromJson(jsonEncode(postRessmap));

      final url = Uri.parse('http://10.0.2.2:4000/users/user-profile/${lab.id}');

      print('Howdy, ${email}!');

      res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin':'true',
        'Authorization': 'Bearer ${lab.token}',
      });
      Map<String, dynamic> postResmap2 = jsonDecode(res.body);
      var dat = postRes2.fromJson(postResmap2);
      return [dat.data, lab.token];
    }
    return null;
  }
}

class postRes {
  final String message;
  final Object data;

  postRes(this.message, this.data);

  postRes.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data,
  };
}
class postRess {
  final String token;
  final int id;

  postRess(this.token, this.id);

  postRess.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
    'token': token,
    'id': id,
  };
}

class postRes2 {
  final String message;
  final List data;

  postRes2(this.message, this.data);

  postRes2.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data,
  };
}