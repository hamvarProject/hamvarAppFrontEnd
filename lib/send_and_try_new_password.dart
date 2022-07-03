import 'package:flutter/material.dart';
import 'package:hamvar2/profile_after_login.dart';
import 'package:hamvar2/recovery_password.dart';

class SendAndTryNewPasswordPage extends StatefulWidget {
  @override
  _SendAndTryNewPasswordPageState createState() =>
      _SendAndTryNewPasswordPageState();
}

class _SendAndTryNewPasswordPageState extends State<SendAndTryNewPasswordPage> {
  String newPassword = "";

  final _formKey = GlobalKey<FormState>();

  bool _showPassword = false;

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
                ":رمز عبور جدید را که برای شما ارسال شده است، وارد کنید",
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
                  if (value.length < 6) {
                    return "رمز عبور جدید را وارد کنید";
                  }
                  newPassword = value;
                  return null;
                },
                textAlign: TextAlign.center,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  hintText: "رمز عبور جدید",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
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
                    // check if newPassword is right or no? then go to page profile2
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => ProfileAfterLoginPage())));
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: MaterialButton(
                  child: const Text("رمز عبور جدید را دریافت نکرده‌اید؟",
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    // send new pass again
                  }),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: MaterialButton(
                  child: const Text("ویرایش شماره موبایل",
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => RecoveryPasswordPage())));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
