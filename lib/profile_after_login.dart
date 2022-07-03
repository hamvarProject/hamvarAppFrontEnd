import 'package:flutter/material.dart';
import 'package:hamvar2/bottom_navigator.dart';
import 'package:hamvar2/settings.dart';
import 'package:hamvar2/place.dart';

class ProfileAfterLoginPage extends StatefulWidget {
  @override
  _ProfileAfterLoginPageState createState() => _ProfileAfterLoginPageState();
}

class _ProfileAfterLoginPageState extends State<ProfileAfterLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      InkWell(
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.settings,
                            size: 35,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => SettingsPage())));
                        },
                      ),
                      const Text(
                        "نیلوفر موجودی",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                        "https://source.unsplash.com/random/100x100?person"),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25, top: 25),
              child: Text(
                "مکان‌های نشان شده",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  BookmarkCards(),
                  BookmarkCards(),
                  BookmarkCards(),
                  BookmarkCards(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25, top: 20),
              child: Text(
                "مکان‌های مناسب شما",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  AccessibleCards(),
                  AccessibleCards(),
                  AccessibleCards(),
                  AccessibleCards(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25, top: 20),
              child: Text(
                "نظرات شما",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  CommentCards(),
                  CommentCards(),
                  CommentCards(),
                  CommentCards(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const MyBottomNavigatorPage(true, false, false, false),
    );
  }
}

class CommentCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => PlacePage())));
      },
      child: Card(
        margin: const EdgeInsets.only(right: 25),
        child: SizedBox(
          height: 134,
          width: 235,
          child: Padding(
            padding: const EdgeInsets.all(12.5),
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  "https://source.unsplash.com/random/40x40?gym"),
                            ),
                          ),
                          const Text("باشگاه آپادانا"),
                        ],
                      ),
                      InkWell(
                        child: const Icon(
                          Icons.delete_forever_outlined,
                          color: Color(0xFF3BBDD3),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              actionsAlignment: MainAxisAlignment.start,
                              content: const Text(
                                  "آیا از حذف این نظر اطمینان دارید؟"),
                              actions: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text("خیر"),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text("بله"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("امکان ورود با ویلچر"),
                        Text("دسترسی از خیابان به پیاده‌رو"),
                        Text("مجهز به بالابر"),
                        Text("مجهز به دستگیره"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookmarkCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => PlacePage())));
      },
      child: Card(
        margin: const EdgeInsets.only(right: 25),
        child: SizedBox(
          height: 152,
          width: 152,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://source.unsplash.com/random/150x120?cafe"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.5, left: 12.5, top: 5),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("کافه رادیو"),
                    InkWell(
                      child: const Icon(
                        Icons.bookmark_remove_outlined,
                        color: Color(0xFF3BBDD3),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            actionsAlignment: MainAxisAlignment.start,
                            content: const Text(
                                "آیا از حذف نشان این مکان اطمینان دارید؟"),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: const Text("خیر"),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("بله"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccessibleCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => PlacePage())));
      },
      child: Card(
        margin: const EdgeInsets.only(right: 25),
        child: Container(
          height: 152,
          width: 152,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://source.unsplash.com/random/150x120?park"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.5, left: 12.5, top: 5),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("پارک آبشار"),
                    InkWell(
                      child: const Icon(
                        Icons.highlight_remove_outlined,
                        color: Color(0xFF3BBDD3),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            actionsAlignment: MainAxisAlignment.start,
                            content: const Text(
                                "آیا از حذف این پیشنهاد اطمینان دارید؟"),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: const Text("خیر"),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("بله"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
