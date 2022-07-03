import 'package:flutter/material.dart';
import 'package:hamvar2/profile_before_login.dart';
import 'package:hamvar2/search.dart';
import 'package:hamvar2/categories.dart';
import 'package:hamvar2/map.dart';
import 'package:geolocator/geolocator.dart';

class MyBottomNavigatorPage extends StatefulWidget {

  final bool selected1;
  final bool selected2;
  final bool selected3;
  final bool selected4;

  const MyBottomNavigatorPage(this.selected1, this.selected2, this.selected3, this.selected4) : super();

  @override
  _MyBottomNavigatorPageState createState() => _MyBottomNavigatorPageState();
}

class _MyBottomNavigatorPageState extends State<MyBottomNavigatorPage> {

  Position location = Position(
      // Azadi tower location
      latitude: 35.6997384,
      longitude: 51.3380605,
      timestamp: DateTime.now(),
      accuracy: 10,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.5, 0, 12.5, 12.5),
      child: Container(
        height: AppBar().preferredSize.height + 15,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Color(0xFFE4F9FC),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                if (widget.selected1 == false){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileBeforeLoginPage()));
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 35,
                    color: widget.selected1? const Color(0xFF3BBDD3) : Colors.black,
                  ),
                  Text(
                    "حساب کاربری",
                    style: TextStyle(color: widget.selected1? const Color(0xFF3BBDD3) : Colors.black),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (widget.selected2 == false){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage()));
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.search_outlined,
                    size: 35,
                    color: widget.selected2? const Color(0xFF3BBDD3) : Colors.black,
                  ),
                  Text("جست‌وجو", style: TextStyle(color: widget.selected2? const Color(0xFF3BBDD3) : Colors.black,
                  ),),
                ],
              ),
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.sort_outlined,
                    size: 35,
                    color: widget.selected3? const Color(0xFF3BBDD3) : Colors.black,
                  ),
                  Text("دسته‌بندی", style: TextStyle(color: widget.selected3? const Color(0xFF3BBDD3) : Colors.black,
                  ),),
                ],
              ),
              onTap: () {
                if (widget.selected3 == false){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CategoriesPage()));
                }
              },
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 35,
                    color: widget.selected4? const Color(0xFF3BBDD3) : Colors.black,
                  ),
                  Text("نقشه", style: TextStyle(color: widget.selected4? const Color(0xFF3BBDD3) : Colors.black,
                  ),),
                ],
              ),
              onTap: () {
                if (widget.selected4 == false){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MapPage(location)));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
