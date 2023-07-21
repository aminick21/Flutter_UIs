import 'package:cookie_ui/screens/cookieTabBarPage.dart';
import 'package:cookie_ui/widgets/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pickup",style: GoogleFonts.varela(fontSize: 20,color: Color(0xFF545D68)),),
        elevation: 0,
        leading: Icon(Icons.arrow_back,color: Color(0xFF545D68)),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.notifications_none,color: Color(0xFFEF7532),),
          SizedBox(width: 10,)
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.fastfood),
      backgroundColor:Color(0xFFEF7532) ,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: ListView(
        padding: EdgeInsets.only(left: 20),
        children: [
          SizedBox(height: 20,),
          Text("Categories",style: GoogleFonts.varela(fontSize: 42,fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          TabBar(
            controller: _controller,
              labelColor: Color(0xFFEF7532),
            unselectedLabelColor: Color(0xFF545D68),
            indicatorColor: Colors.transparent,
            isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
            tabs: [
            Text("Cookies",style: GoogleFonts.varela(fontSize: 24),),
            Text("Cookie cake",style: GoogleFonts.varela(fontSize: 24),),
            Text("Ice cream",style: GoogleFonts.varela(fontSize: 24),),
          ]),
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(
                  controller:_controller,
                  children: [
                    CookiePage(),
                    CookiePage(),
                    CookiePage(),
                  ],
              ),
          ),
          SizedBox(height: 15,)
        ],
      ),


    );
  }
}
