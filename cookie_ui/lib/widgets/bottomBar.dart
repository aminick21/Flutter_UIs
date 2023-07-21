
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      notchMargin: 6,
      elevation: 9,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
            color: Colors.white
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width /2 - 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.home, color: Color(0xFFEF7532)),
                      Icon(Icons.person_outline, color: Color(0xFF676E79))
                    ],
                  )
              ),
              Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width /2 - 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.search, color: Color(0xFF676E79)),
                      Icon(Icons.shopping_basket, color: Color(0xFF676E79))
                    ],
                  )
              ),
            ]
        ),),
    );
  }
}
