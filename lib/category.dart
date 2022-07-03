import 'package:flutter/material.dart';
import 'package:hamvar2/category_filters.dart';
import 'package:hamvar2/category_sort.dart';
import 'package:hamvar2/place.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoriyResultPage createState() => _CategoriyResultPage();
}

class _CategoriyResultPage extends State<CategoryPage> {
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
          "کافه و رستوران",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE4F9FC),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: InkWell(
                        child: const Icon(
                          Icons.manage_search_outlined,
                          size: 30,
                          color: Color(0xFF3BBDD3),
                        ),
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext bc) {
                              return FractionallySizedBox(
                                  heightFactor: 0.77,
                                  child: CategoriesFiltersPage());
                            },
                          );
                        },
                      ),
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.format_line_spacing_outlined,
                        size: 30,
                        color: Color(0xFF3BBDD3),
                      ),
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return FractionallySizedBox(
                                heightFactor: 0.38, child: CategoriesSortPage());
                          },
                        );
                      },
                    ),
                  ],
                ),
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
                    child: Icon(
                      myIcons[position][0],
                      color: myIcons[position][1],
                    ),
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
