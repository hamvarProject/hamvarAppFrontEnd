import 'package:flutter/material.dart';
import 'package:hamvar2/bottom_navigator.dart';
import 'package:hamvar2/category.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "دسته‌بندی",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE4F9FC),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (position) {
              return categoriesCards(position, context);
            }),
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigatorPage(false, false, true, false),
    );
  }
}

Card categoriesCards(int position, context) {
  List<IconData> myIcons = [
    Icons.local_cafe_outlined,
    Icons.medical_services_outlined,
    Icons.interests_outlined,
    Icons.train_outlined,
    Icons.home_outlined,
    Icons.add_outlined,
  ];
  List<String> names = [
    "کافه و رستوران",
    "پزشکی",
    "تفریحی و سرگرمی",
    "حمل‌ونقل عمومی",
    "بانک",
    "سایر"
  ];
  return Card(
    child: InkWell(
      onTap: () {
        if (position == 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => (CategoryPage())));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            myIcons[position],
            size: 50,
            color: const Color(0xFF3BBDD3),
          ),
          Text(
            names[position],
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}
