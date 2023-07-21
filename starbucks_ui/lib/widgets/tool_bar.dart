import 'package:flutter/material.dart';

class ToolBar extends StatefulWidget {
  const ToolBar({Key? key}) : super(key: key);

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
        children: [
          Image.asset('images/location.png',width: 40,height: 40,),
          Spacer(),
          Image.asset('images/drawer.png',width: 40,height: 40,),
        ],

      ),
    );
  }
}

