import 'package:flutter/material.dart';

class Comment2Page extends StatefulWidget {
  @override
  _Comment2PageState createState() => _Comment2PageState();
}

class _Comment2PageState extends State<Comment2Page> {
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
                    "نظر شما",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              TextFormField(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "نظر خود را درباره‌ی این مکان بنویسید",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xFF3BBDD3),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.image_outlined,
                          color: Color(0xFF3BBDD3),
                        ),
                        Text(
                          "اضافه کردن تصویر",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    color: const Color(0xFF3BBDD3),
                    child: const Text(
                      "ثبت نظر",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      var snackBar = const SnackBar(
                          content: Text(
                        "نظر شما با موفقیت ثبت شد!",
                        textDirection: TextDirection.rtl,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
