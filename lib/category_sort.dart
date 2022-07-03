import 'package:flutter/material.dart';

class CategoriesSortPage extends StatefulWidget {
  @override
  _CategoriesSortPageState createState() => _CategoriesSortPageState();
}

class _CategoriesSortPageState extends State<CategoriesSortPage> {

  String val = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "مرتب‌سازی",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      value: "close",
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value.toString();
                        });
                      }),
                  const Text(
                    "نزدیک‌ترین",
                  ),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      value: "Accessible",
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value.toString();
                        });
                      }),
                  const Text(
                    "مناسب‌سازی شده‌ترین",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    color: const Color(0xFF3BBDD3),
                    child: const Text(
                      "اعمال مرتب‌سازی",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
