import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parallax_effect/parallax_delegate.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parallax Effect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _controller;
  int selectedIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    _controller=PageController(viewportFraction: .8);
    super.initState();
  }

  changeSelectedIndex(index){
    setState(() {
      selectedIndex=index;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Parallax Effect',
              style: GoogleFonts.poppins(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.7,
            child: PageView.builder(
              onPageChanged: (index)=>changeSelectedIndex(index),
              itemCount:3,
              controller: _controller,
              itemBuilder:(context,index){
              return VideoCard(
                path:'assets/${index+1}.mp4',
                isSelected: selectedIndex==index,
              );
              }
            ),
          )

        ],
      ),
    );
  }
}

class VideoCard extends StatefulWidget {
  final String path;
  final bool isSelected;
  const VideoCard({
    Key? key,
    required this.path,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {

  final GlobalKey _videoKey=GlobalKey();
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller=VideoPlayerController.asset(widget.path);
    _controller
      ..addListener(()=>setState(() {}))
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((value) => setState((){}))
      ..play();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: widget.isSelected
           ? EdgeInsets.symmetric(vertical: 16,horizontal: 4)
            :EdgeInsets.symmetric(vertical: 32,horizontal: 16) ,
      duration: const Duration(
        milliseconds: 250
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            offset: const Offset(0, 6),
            blurRadius: 8
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
          child: Flow(
            delegate: ParallaxFlowDelegate(
                scrollable: Scrollable.of(context)!,
                listItemContext: context,
                backgroundImageKey:_videoKey,
            ),
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller,key: _videoKey,)
              ),
            ]
          )),
    );
  }
}
