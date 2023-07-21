import 'package:flutter/material.dart';

class BuildLogo extends StatefulWidget {
  const BuildLogo({Key? key}) : super(key: key);

  @override
  State<BuildLogo> createState() => _BuildLogoState();
}

class _BuildLogoState extends State<BuildLogo> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top:10,
        right: MediaQuery.of(context).size.width/2-30,
        child:Image.asset('images/logo.png',height: 60,width: 60,), );
  }
}
