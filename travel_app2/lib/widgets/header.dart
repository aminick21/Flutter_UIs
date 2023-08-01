import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app2/models/places.dart';
import 'package:travel_app2/widgets/like_and_share.dart';
import 'package:travel_app2/widgets/translate_animation.dart';
import 'package:travel_app2/widgets/user_info.dart';

class DetailHeader extends StatefulWidget {
  const DetailHeader({
    Key? key,
    required this.place,
    required this.topPercent,
    required this.bottomPercent,
  }) : super(key: key);

  final TravelPlaces place;
  final double topPercent;
  final double bottomPercent;

  @override
  State<DetailHeader> createState() => _DetailHeaderState();
}

class _DetailHeaderState extends State<DetailHeader> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0, viewportFraction: .9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRect(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: (20 + topPadding) * (1 - widget.bottomPercent),
                  bottom: 160 * (1 - widget.bottomPercent),
                ),
                child: Transform.scale(
                  scale: lerpDouble(1, 1.3, widget.bottomPercent),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: widget.place.imagesUrl.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final imageUrl = widget.place.imagesUrl[index];
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black26, BlendMode.darken))),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        effect: SlideEffect(
                            spacing: 8.0,
                            radius: 4.0,
                            dotWidth: 24.0,
                            dotHeight: 4.0,
                            dotColor: Colors.black26,
                            activeDotColor: Colors.blue),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: topPadding,
                  left: -60*(1-widget.bottomPercent),
                  child:IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                 icon: Icon(Icons.arrow_back,color: Colors.white,),) ),
              Positioned(
                  top: topPadding,
                  right: -60*(1-widget.bottomPercent),
                  child:IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.more_vert,color: Colors.white,),) )
            ],
          ),
        ),
        Positioned.fill(
            top: null,
            child: TranslateAnimation(
              child: LikesAndShare(
                widget: widget,
              ),
            )),
        Positioned.fill(
            top: null,
            child: TranslateAnimation(child: UserInfoContainer(widget: widget))),
      ],
    );
  }
}


