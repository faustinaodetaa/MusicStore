import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qualif/views/pages/home.dart';
import 'package:qualif/utils/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var _user = TextEditingController();
  var _email = TextEditingController();
  var _pass = TextEditingController();

  bool isUserValidate = true;
  bool isEmailValidate = true;
  bool isPassValidate = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple[100],
            primarySwatch: Colors.purple,
            fontFamily: 'Quicksand'),
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Icon(Icons.music_note_rounded),
                Text(
                  'YAMAHA MUSIC',
                  style: TextStyle(fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Image.asset('assets/logo.png', width: 150, height: 100),
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
                TextField(
                  controller: _user,
                  decoration: InputDecoration(
                      labelText: 'Enter Username',
                      errorText:
                          !isUserValidate ? 'Please enter a Username' : null),
                ),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                      labelText: 'Enter Email',
                      errorText: !isEmailValidate
                          ? 'Email must ends with "@gmail.com" !'
                          : null),
                ),
                TextField(
                    controller: _pass,
                    decoration: InputDecoration(
                        labelText: 'Enter Password',
                        errorText: !isPassValidate
                            ? 'Password must be at least 8 characters!'
                            : null),
                    obscureText: true),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    validateUser(_user.text);
                    validateEmail(_email.text);
                    validatePass(_pass.text);
                    if (validateUser(_user.text) &&
                        validateEmail(_email.text) &&
                        validatePass(_pass.text)) {
                      globals.currUser = _user.text;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return HomePage();
                      }));
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.purple[100]),
                ),
              ])),
        ));
  }

  bool validateUser(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isUserValidate = false;
      });
      return false;
    }
    setState(() {
      isUserValidate = true;
    });
    return true;
  }

  bool validateEmail(String userInput) {
    if (!userInput.endsWith("@gmail.com")) {
      setState(() {
        isEmailValidate = false;
      });
      return false;
    }
    setState(() {
      isEmailValidate = true;
    });
    return true;
  }

  bool validatePass(String userInput) {
    if (userInput.length < 8) {
      setState(() {
        isPassValidate = false;
      });
      return false;
    }
    setState(() {
      isPassValidate = true;
    });
    return true;
  }
}
