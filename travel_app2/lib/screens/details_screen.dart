import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app2/models/places.dart';
import 'package:travel_app2/models/user.dart';
import 'package:travel_app2/widgets/header.dart';
import 'package:travel_app2/widgets/translate_animation.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {super.key, required this.place, required this.screenHeight});
  final TravelPlaces place;
  final double screenHeight;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late ScrollController _controller;
  late ValueNotifier<double> bottomPercentNotifier;
  bool _isAnimatingScroll=false;

  void _scrollListener() {
    var percent =
        _controller.position.pixels / MediaQuery.of(context).size.height;
    bottomPercentNotifier.value = (percent / .3).clamp(0.0, 1.0);
  }

  void _isScrollingListener() {
     var percent = _controller.position.pixels/widget.screenHeight;

     if(!_controller.position.isScrollingNotifier.value){
       if(percent<.3&&percent>.1){

         setState(() => _isAnimatingScroll=true);

         _controller.animateTo(widget.screenHeight*.3,
             duration: kThemeAnimationDuration,
             curve: Curves.decelerate).then((value) => setState(() => _isAnimatingScroll=false));
       }
       if(percent<.1&&percent>0){
         setState(() => _isAnimatingScroll=true);
         _controller.animateTo(
             0,
             duration: kThemeAnimationDuration,
             curve: Curves.decelerate).then((value) => setState(() => _isAnimatingScroll=false));
       }
       if(percent<.5&&percent>.3){
         setState(() => _isAnimatingScroll=true);
         _controller.animateTo(
             widget.screenHeight*.3,
             duration: kThemeAnimationDuration,
             curve: Curves.decelerate).then((value) => setState(() => _isAnimatingScroll=false));
       }

     }



  }


  @override
  void initState() {
    _controller =
        ScrollController(initialScrollOffset: widget.screenHeight * .3);
    _controller.addListener(_scrollListener);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _controller.position.isScrollingNotifier
          .addListener(_isScrollingListener);
    });
    bottomPercentNotifier = ValueNotifier(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AbsorbPointer(
            absorbing: _isAnimatingScroll,
            child: CustomScrollView(
              controller: _controller,
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                    delegate: BuilderPersistentDelegate(
                        maxExtent: MediaQuery.of(context).size.height,
                        minExtent: 250,
                        builder: (percent) {
                          final bottomPercent = (percent / .3).clamp(0.0, 1.0);
                          return DetailHeader(
                            place: widget.place,
                            topPercent: ((1 - percent) / 7).clamp(0.0, 1.0),
                            bottomPercent: bottomPercent,
                          );
                        })),
                // SliverToBoxAdapter(
                //   child: Divider(
                //     thickness: 2,
                //   ),
                // ),
                SliverToBoxAdapter(
                  child: TranslateAnimation(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.black26,
                                size: 26,
                              ),
                              Flexible(
                                child: Text(
                                  widget.place.locationDesc,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.place.desc,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   widget.place.desc,
                          //   style:GoogleFonts.poppins(
                          //     color: Colors.black,
                          //     fontSize: 14
                          //   ),
                          //   // TextStyle(color: Colors.black, fontSize: 14),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'PLACES IN THE COLLECTION',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 180,
                    child: ListView.builder(
                        itemCount: 5,
                        itemExtent: 150,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                widget.place.collection[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 130,
                  ),
                )
              ],
            ),
          ),
          ValueListenableBuilder(
            builder: (context, value, child) {
              return Positioned.fill(
                  top: null, bottom: -130.0 * (1 - value), child: child!);
            },
            valueListenable: bottomPercentNotifier,
            child: Container(
              height: 130,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white.withOpacity(0), Colors.white])),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Align(
                            widthFactor: .7,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      users[i].urlPhoto,
                                    ),
                                  )),
                            ),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Comments',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          CupertinoIcons.arrow_right,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade50,
                        borderRadius: BorderRadius.circular(18)),
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  final Widget Function(double percent) builder;
  BuilderPersistentDelegate({
    required double maxExtent,
    required double minExtent,
    required this.builder,
  })  : _maxExtent = maxExtent,
        _minExtent = minExtent;

  final double _maxExtent;
  final double _minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / maxExtent);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  double get minExtent => _minExtent;
  @override
  double get maxExtent => _maxExtent;
}
