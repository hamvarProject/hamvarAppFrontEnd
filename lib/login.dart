import 'package:flutter/material.dart';
import 'package:hamvar2/recovery_password.dart';
import 'package:hamvar2/signup.dart';
import 'package:hamvar2/profile_after_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "ورود",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE4F9FC),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 25),
              child: TextFormField(
                validator: (value) {
                  if (value == null) {
                    return "value is null";
                  }
                  if (value.isEmpty) {
                    return "شماره موبایل خود را وارد کنید";
                  } else if (value.length < 11 ||
                      num.tryParse(value) == null) {
                    return "شماره موبایل خود را به درستی وارد کنید";
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "شماره موبایل",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 50),
              child: TextFormField(
                validator: (value) {
                  if (value == null) {
                    return "value is null";
                  }
                  if (value.isEmpty) {
                    return "رمز عبور خود را وارد کنید";
                  } else if (value.length < 6) {
                    return "رمز عبور باید حداقل ۶ کاراکتر داشته باشد";
                  }
                  return null;
                },
                obscureText: !_showPassword,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "رمز عبور",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    onPressed: (){
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                color: const Color(0xFF3BBDD3),
                child: const Text(
                  "ورود",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // check does user exist? then go to page profile2
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => (ProfileAfterLoginPage())));
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: MaterialButton(
                  child: const Text("رمز عبور خود را فراموش کرده‌اید؟",
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecoveryPasswordPage()));
                  }),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: MaterialButton(
                  child: const Text("ثبت نام نکرده‌اید؟",
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
