import 'package:flutter/material.dart';
import 'package:hamvar2/comment2.dart';

class Commnet1Page extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<Commnet1Page> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Color(0xFF3BBDD3),
              ))
        ],
        title: const Text(
          "ثبت نظر",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE4F9FC),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 50, 25, 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          "https://source.unsplash.com/random/100x100?cafe"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "کافه‌رستوران سیگنیچر",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "امکانات",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () => setState(() {
                            isChecked1 = !isChecked1;
                          }),
                      child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Checkbox(
                                    activeColor: const Color(0xFF3BBDD3),
                                    value: isChecked1,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked1 = !isChecked1;
                                        isChecked1 = value!;
                                      });
                                    })),
                            const SizedBox(width: 10.0),
                            const Text(
                              "آسانسور یا بالابر",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          ])),
                  TextButton(
                      onPressed: () => setState(() {
                            isChecked2 = !isChecked2;
                          }),
                      child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Checkbox(
                                    activeColor: const Color(0xFF3BBDD3),
                                    value: isChecked2,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked2 = !isChecked2;
                                        isChecked2 = value!;
                                      });
                                    })),
                            const SizedBox(width: 10.0),
                            const Text(
                              "سطح شیب‌دار",
                              style: TextStyle(color: Colors.black),
                            )
                          ])),
                  TextButton(
                      onPressed: () => setState(() {
                            isChecked3 = !isChecked3;
                          }),
                      child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Checkbox(
                                    activeColor: const Color(0xFF3BBDD3),
                                    value: isChecked3,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked3 = !isChecked3;
                                        isChecked3 = value!;
                                      });
                                    })),
                            const SizedBox(width: 10.0),
                            const Text(
                              "پارکنیگ قابل دسترسی",
                              style: TextStyle(color: Colors.black),
                            )
                          ])),
                  TextButton(
                      onPressed: () => setState(() {
                            isChecked4 = !isChecked4;
                          }),
                      child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Checkbox(
                                    activeColor: const Color(0xFF3BBDD3),
                                    value: isChecked4,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked4 = !isChecked4;
                                        isChecked4 = value!;
                                      });
                                    })),
                            const SizedBox(width: 10.0),
                            const Text(
                              "سرویس بهداشتی فرنگی",
                              style: TextStyle(color: Colors.black),
                            )
                          ])),
                  TextButton(
                      onPressed: () => setState(() {
                            isChecked5 = !isChecked5;
                          }),
                      child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Checkbox(
                                    activeColor: const Color(0xFF3BBDD3),
                                    value: isChecked5,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked5 = !isChecked5;
                                        isChecked5 = value!;
                                      });
                                    })),
                            const SizedBox(width: 10.0),
                            const Text(
                              "پله‌برقی",
                              style: TextStyle(color: Colors.black),
                            )
                          ])),
                  TextButton(
                    onPressed: () => setState(() {
                      isChecked6 = !isChecked6;
                    }),
                    child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: Checkbox(
                                  activeColor: const Color(0xFF3BBDD3),
                                  value: isChecked6,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked6 = !isChecked6;
                                      isChecked6 = value!;
                                    });
                                  })),
                          const SizedBox(width: 10.0),
                          const Text(
                            "دسترسی از خیابان به پیاده‌رو",
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Text(
                          show ? "بایستی حداقل یک گزینه را انتخاب کنید!" : "",
                          style: const TextStyle(
                              color: Color(0xFFD53838), fontSize: 12),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
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
                      "ادامه",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    onPressed: () {
                      if (!isChecked1 &&
                          !isChecked2 &&
                          !isChecked3 &&
                          !isChecked4 &&
                          !isChecked5 &&
                          !isChecked6) {
                        setState(() {
                          show = true;
                        });
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Comment2Page())));
                      }
                    },
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
