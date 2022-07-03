import 'package:flutter/material.dart';

class MoreInformationPage extends StatefulWidget {
  @override
  _MoreInformationPageState createState() => _MoreInformationPageState();
}

class _MoreInformationPageState extends State<MoreInformationPage> {
  List<String> items = ["خانم", "آقا"];

  String? gender;

  bool show = false;

  final _formKey = GlobalKey<FormState>();

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
          "تکمیل اطلاعات",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE4F9FC),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 25, left: 25),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(
                      "https://source.unsplash.com/random/130x130?person",
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 25),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "value is null";
                    }
                    if (value.isEmpty) {
                      return "نام خود را وارد کنید";
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "نام",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    hint: const Text("نوع معلولیت"),
                    items: ["عصا دارم", "ویلچر دارم", "عصا یا ویلچر ندارم"]
                        .map((String value) {
                      return DropdownMenuItem(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null) {
                        return "نوع معلولیت خود را انتخاب کنید";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text("جنسیت",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                    Flexible(
                      child: ListTile(
                        title: const Text("خانم"),
                        horizontalTitleGap: 5,
                        leading: Radio(
                          activeColor: const Color(0xFF3BBDD3),
                          value: "female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListTile(
                        title: const Text("آقا"),
                        horizontalTitleGap: 5,
                        leading: Radio(
                          activeColor: const Color(0xFF3BBDD3),
                          value: "male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      show ? "جنسیت خود را انتخاب کنید" : "",
                      style: const TextStyle(
                          color: Color(0xFFD53838), fontSize: 12),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35),
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: const Color(0xFF3BBDD3),
                  child: const Text(
                    "ثبت",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        (gender == "female" || gender == "male")) {
                      // check if gender is available or no
                      // save information then show the success message
                      setState(() {
                        show = false;
                      });
                      var snackBar = const SnackBar(
                          content: Text(
                            "اطلاعات شما با موفقیت ثبت شد!",
                            textDirection: TextDirection.rtl,
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      setState(() {
                        show = true;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
