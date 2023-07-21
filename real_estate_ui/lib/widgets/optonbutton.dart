import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton({Key? key,required this.text,required this.icon,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        maximumSize: Size.fromWidth(width),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: const Color.fromRGBO(20, 25, 45, 1),
      ),
      onPressed: (){},
      child: Row(
        children: [
          Icon(icon,color: Colors.white,),
          const SizedBox(width: 10,),
          Text(text,
          style: const TextStyle(
            color: Colors.white,
          ),
          ),
        ],
      ),

    );
  }
}
