import 'package:flutter/material.dart';
import 'package:hamvar2/comment1.dart';
import 'package:hamvar2/map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  bool bookmarkSelected = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Color(0xFF3BBDD3),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: SafeArea(
          child: Column(
            children: [
              Image.network(
                "https://source.unsplash.com/random/411x300?cafe",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined, size: 30)),
                    const Text(
                      "کافه‌رستوران سیگنیچر",
                      style: TextStyle(fontSize: 25),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          bookmarkSelected = !bookmarkSelected;
                        });
                      },
                      icon: bookmarkSelected
                          ? const Icon(
                              Icons.bookmark,
                              size: 30,
                            )
                          : const Icon(
                              Icons.bookmark_border_outlined,
                              size: 30,
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
                child: AppBar(
                  backgroundColor: const Color(0xFF3BBDD3),
                  automaticallyImplyLeading: false,
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        text: "نظرات کاربران",
                      ),
                      Tab(
                        text: "دسترسی‌پذیری",
                      ),
                      Tab(
                        text: "اطلاعات عمومی",
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 25, left: 25, top: 12.5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            commentCards(),
                            commentCards(),
                            commentCards(),
                            commentCards(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.5, bottom: 12.5),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 50,
                                child: MaterialButton(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  color: const Color(0xFF3BBDD3),
                                  child: const Text(
                                    "ثبت نظر شما برای این مکان",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                Commnet1Page())));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 25, left: 25, bottom: 12.5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(
                                    Icons.elevator_outlined,
                                    size: 30,
                                  ),
                                  Text(
                                    "آسانسور یا بالابر",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(
                                  Icons.wheelchair_pickup_outlined,
                                  size: 30,
                                ),
                                Text(
                                  "سطح شیب‌دار",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(
                                    Icons.stairs_outlined,
                                    size: 30,
                                  ),
                                  Text(
                                    "پله‌برقی",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 25, left: 25, bottom: 12.5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                verticalDirection: VerticalDirection.up,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Position _location = Position(
                                          // Parvaz complex location
                                          latitude: 32.611632,
                                          longitude: 51.67845,
                                          timestamp: DateTime.now(),
                                          accuracy: 10,
                                          altitude: 0,
                                          heading: 0,
                                          speed: 0,
                                          speedAccuracy: 10);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  (MapPage(_location))));
                                    },
                                    icon: const Icon(
                                      Icons.location_on_outlined,
                                      size: 30,
                                    ),
                                  ),
                                  const Text(
                                    "اصفهان، مجموعه‌ی راویس",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    var _url = Uri.parse("tel://03136700980");
                                    if (await canLaunchUrl(_url)) {
                                      await launchUrl(_url);
                                    } else {
                                      throw 'Could not make call.';
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.call_outlined,
                                    size: 30,
                                  ),
                                ),
                                const Text(
                                  "۰۳۱۳۶۷۰۰۹۸۰",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.lock_clock,
                                      size: 30,
                                    ),
                                  ),
                                  const Text(
                                    "از ۸ الی ۲۴",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    var _url = Uri.parse(
                                        "https://instagram.com/signature_cafe_restaurant?igshid=YmMyMTA2M2Y=");
                                    if (await canLaunchUrl(_url)) {
                                      await launchUrl(_url);
                                    } else {
                                      throw 'Could not open webpage.';
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.wifi_outlined,
                                    size: 30,
                                  ),
                                ),
                                const Text(
                                  "signature_cafe_restaurant",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Card commentCards() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                    "https://source.unsplash.com/random/40x40?person"),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 12.5),
                child: Text("کیاناز نره‌ئی"),
              ),
            ],
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 12.5, bottom: 12.5),
                child: Text(
                  "سطح شیب‌دار بیرون از کافه به صورت متحرک قرار داده میشه به این توجه کنید که ثابت نیست.",
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12.5),
                child: Text("۱۲"),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
