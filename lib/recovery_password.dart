import 'package:flutter/material.dart';
import 'package:hamvar2/login.dart';
import 'package:hamvar2/send_and_try_new_password.dart';

class RecoveryPasswordPage extends StatefulWidget {
  @override
  _RecoveryPasswordPageState createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "بازیابی رمز عبور",
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
              child: const Text(
                ":برای بازیابی رمز عبور، شماره موبایل خود را وارد کنید",
                textAlign: TextAlign.center,
                style: TextStyle(),
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
                  "بازیابی رمز عبور",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) =>
                            SendAndTryNewPasswordPage())));
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: MaterialButton(
                  child: const Text("بازگشت به صفحه‌ی ورود",
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
