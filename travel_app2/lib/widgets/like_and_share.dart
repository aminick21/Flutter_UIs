import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app2/widgets/header.dart';

class LikesAndShare extends StatelessWidget {
  const LikesAndShare({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DetailHeader widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius:
          BorderRadius.vertical(top: Radius.circular(30))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.heart,
                size: 26,
              ),
              label: Text(
                widget.place.likes.toString(),
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
          TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.black),
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.reply,
              size: 26,
            ),
            label: Text(
              widget.place.shared.toString(),
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Spacer(),
          TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
                primary: Colors.blue.shade600,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {},
              icon: Icon(
                Icons.check_circle_outline_outlined,
                size: 26,
              ),
              label: Text(
                'Checkin',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}