import 'package:flutter/material.dart';

class CategoriesFiltersPage extends StatefulWidget {
  @override
  _CategoriesFiltersPageState createState() => _CategoriesFiltersPageState();
}

class _CategoriesFiltersPageState extends State<CategoriesFiltersPage> {

  List<bool> isChecked1 = [false, false, false];
  List<String> title1 = [
    "اصلا مناسب‌سازی نشده",
    "تقریبا مناسب‌سازی شده",
    "کاملا مناسب‌سازی شده"
  ];

  List<bool> isChecked2 = [false, false, false, false];
  List<String> title2 = [
    "آسانسور یا بالابر",
    "سطح شیب‌دار",
    "پارکینگ قابل دسترسی",
    "سرویس بهداشتی فرنگی"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
          child: Column(
            children: [
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "فیلترها",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          "سطح دسترسی‌پذیری",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  myCheckBox(context, isChecked1, title1, 0),
                  myCheckBox(context, isChecked1, title1, 1),
                  myCheckBox(context, isChecked1, title1, 2),
                ],
              ),
              Column(
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "امکانات",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  myCheckBox(context, isChecked2, title2, 0),
                  myCheckBox(context, isChecked2, title2, 1),
                  myCheckBox(context, isChecked2, title2, 2),
                  myCheckBox(context, isChecked2, title2, 3),
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
                      "اعمال فیلترها",
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

  TextButton myCheckBox(BuildContext context, List<bool> isChecked,
      List<String> title, int position) {
    return TextButton(
        onPressed: () =>
            setState(() => isChecked[position] = !isChecked[position]),
        child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                      value: isChecked[position],
                      onChanged: (value) {
                        setState(() => isChecked[position] = value!);
                      })),
              const SizedBox(width: 10.0),
              Text(
                title[position],
                style: const TextStyle(color: Colors.black),
              )
            ]));
  }
}
