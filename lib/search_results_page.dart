import 'package:flutter/material.dart';
import 'package:hamvar2/place.dart';

class SearchResultsPage extends StatefulWidget {
  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.5),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.5, 20, 12.5, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              Column(
                children: List.generate(5, (position) {
                  return results(position, context);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Card results(position, context) {
  List<String> cafes = ["سیگنیچر", "هزار و یک", "لوتوس", "باکس", "شهرزاد"];

  List<dynamic> myIcons = [
    [Icons.thumb_up_outlined, Colors.green],
    [Icons.thumb_up_outlined, Colors.green],
    [Icons.priority_high_outlined, Colors.yellow],
    [Icons.thumb_down_outlined, Colors.red],
    [Icons.priority_high_outlined, Colors.yellow],
  ];

  return Card(
    child: InkWell(
      onTap: () {
        if (position == 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => (PlacePage())));
        }
      },
      child: SizedBox(
        height: 80,
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child:
                        Icon(myIcons[position][0], color: myIcons[position][1]),
                  ),
                  Text(
                    cafes[position],
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_left_outlined),
          ],
        ),
      ),
    ),
  );
}
