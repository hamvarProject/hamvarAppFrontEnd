import 'package:flutter/material.dart';
import 'package:hamvar2/profile_after_login.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  String authenticationCode = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "ثبت نام",
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
                ":کد تایید را که برای شما ارسال شده است، وارد کنید",
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
                  if (value.length != 5) {
                    return "کد تایید ۵ رقمی را وارد کنید";
                  }
                  authenticationCode = value;
                  return null;
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "کد تایید",
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
                  "تکمیل ثبت نام",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // check if code is right or no? then go to page profile2
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => (ProfileAfterLoginPage())));
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: MaterialButton(
                  child: const Text("کد را دریافت نکرده‌اید؟",
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    // send code again
                  }),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: MaterialButton(
                  child: const Text("ویرایش شماره موبایل",
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
