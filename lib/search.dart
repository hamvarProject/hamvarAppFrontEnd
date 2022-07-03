import 'package:flutter/material.dart';
import 'package:hamvar2/search_results_page.dart';
import 'package:hamvar2/bottom_navigator.dart';
import 'package:hamvar2/place.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "جست‌وجو",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE4F9FC),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: const Color(0xFFE4F9FC),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: "جست‌وجو",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                    ),
                  ),
                  onEditingComplete: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => SearchResultsPage())));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.timelapse_outlined,
                        color: Color(0xFF3BBDD3),
                      ),
                    ),
                    Text(
                      "جست‌وجوهای اخیر",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    recentsAndMosts("بانک رفاه"),
                    recentsAndMosts("بیمارستان خورشید"),
                    recentsAndMosts("رستوران شهرزاد"),
                    recentsAndMosts("پارک صفه"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.whatshot_outlined,
                        color: Color(0xFF3BBDD3),
                      ),
                    ),
                    Text(
                      "پربازدیدترین مکان‌ها",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    recentsAndMosts("کافه شهر کتاب"),
                    recentsAndMosts("بانک ملی"),
                    recentsAndMosts("رستوران شهرزاد"),
                    recentsAndMosts("دانشگاه اصفهان"),
                    recentsAndMosts("پارک ناژوان"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const MyBottomNavigatorPage(false, true, false, false),
    );
  }

  Card recentsAndMosts(String place) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => PlacePage())));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(place),
        ),
      ),
    );
  }
}
