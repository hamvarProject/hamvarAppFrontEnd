import 'package:flutter/material.dart';
import 'package:hamvar2/more_information.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "تنظیمات",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE4F9FC),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                InkWell(
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "ویرایش اطلاعات",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.arrow_left),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => MoreInformationPage())));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: InkWell(
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "تماس با ما",
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.arrow_left),
                      ],
                    ),
                    onTap: () {
                      // go to tamas page
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "درباره ما",
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.arrow_left),
                      ],
                    ),
                    onTap: () {
                      // go to darbare  page
                    },
                  ),
                ),
                InkWell(
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "قوانین و مقررات",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.arrow_left),
                    ],
                  ),
                  onTap: () {
                    // go to ghavanin page
                  },
                ),
              ],
            ),
            const Center(
              child: Text(
                "ورژن ۱.۰.۰",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
