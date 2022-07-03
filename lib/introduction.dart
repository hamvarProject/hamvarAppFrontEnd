import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hamvar2/categories.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "می‌دانیم که فضاهای شهری به ندرت برای افراد دارای معلولیت جسمی-حرکتی مناسب‌سازی شده‌اند.",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  "با هموار این مکان‌ها را شناسایی کنید.",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          image: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset("assets/images/intro1.png"),
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              children: [
                const Text(
                  "در هموار مکان‌های مناسب‌‌سازی شده‌ی شهر را به دیگران معرفی کنید.",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child: Text(
                    "با هم نقشه‌ی مناسب‌سازی شده‌ی شهر را بسازیم.",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(0xFF3BBDD3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CategoriesPage()));
                      },
                      child: const Text(
                        "بزن بریم!",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          image: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset("assets/images/intro2.png"),
          ),
        ),
      ],
      showSkipButton: false,
      showNextButton: false,
      showBackButton: false,
      showDoneButton: false,
      dotsDecorator: const DotsDecorator(
        activeColor: Color(0xFF3BBDD3),
      ),
    );
  }
}
