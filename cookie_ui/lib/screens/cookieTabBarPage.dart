import 'package:cookie_ui/widgets/cookieCard.dart';
import 'package:flutter/material.dart';

class CookiePage extends StatefulWidget {
  const CookiePage({Key? key}) : super(key: key);

  @override
  State<CookiePage> createState() => _CookiePageState();
}

class _CookiePageState extends State<CookiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body:ListView(
        children: <Widget>[
          SizedBox(height: 30.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  CookieCard('Cookie mint', '\$3.99', 'assets/cookiemint.jpg',
                      false, context),
                  CookieCard('Cookie cream', '\$5.99', 'assets/cookiecream.jpg',
                      true, context),
                  CookieCard('Cookie classic', '\$1.99',
                      'assets/cookieclassic.jpg', false, context),
                  CookieCard('Cookie choco', '\$2.99', 'assets/cookiechoco.jpg',
                      false, context)
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );


  }
}
