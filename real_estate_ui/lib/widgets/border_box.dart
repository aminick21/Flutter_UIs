import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? height,width;

  const BorderBox({Key? key,this.padding,this.height, this.width,required this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: child),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromRGBO(141,141,141,1.0),
            width:1),

      ),
      padding: padding??const EdgeInsets.all(8),

    );
  }
}
