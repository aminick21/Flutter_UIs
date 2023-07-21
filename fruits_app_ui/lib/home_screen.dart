import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app_ui/FruitCard.dart';
import 'package:fruits_app_ui/FruitDetailPage.dart';
import 'package:fruits_app_ui/FruitModel.dart';

import 'CartPage.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late TabController controller;
  CarouselController ctr=CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=TabController(length: 4,vsync: this);
  }

  List<Widget> namesOfFruits(){
    List<Widget> listOfTabs=[];
    for(var product in listOfFruits){
      listOfTabs.add(Text(product.name,
        style:TextStyle(fontSize: 20,),));
    }
    return listOfTabs;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
        const  SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.grey,)),
              Expanded(
                child: Container(
                  height:50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon:Icon(Icons.search,color: Colors.grey,),
                    ),

                  ),
                ),
              ),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
              }, icon: Icon(Icons.shopping_cart,color: Colors.grey,)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15,top: 20,bottom: 10),
            child: Text("All Fruits",
            style: TextStyle(
          fontSize: 28,
              fontWeight: FontWeight.bold

            ),),
          ),
        TabBar(
          controller: controller,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(.6),
            isScrollable: true,
            tabs: namesOfFruits(),
          onTap: (value){
            ctr.animateToPage(value);
          },



        ),

        Padding(
          padding: const EdgeInsets.only(left: 15,top: 20),
          child: Container(
            child: CarouselSlider(
              items:[
                FruitCard(0),
                FruitCard(1),
                FruitCard(2),
                FruitCard(3),
              ],
              options: CarouselOptions(
                padEnds: false,
                enableInfiniteScroll: false,
                height: MediaQuery.of(context).size.height/2,
                onPageChanged: (value,reason){
                  setState(() {
                    controller.animateTo(value);
                  });
                }
              ),
              carouselController:ctr ,

            ),
          ),
        ),
          Padding(
            padding: EdgeInsets.only(left: 15,top: 20,bottom: 10),
            child: Text("All Fruits",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold

              ),),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FruitCardItem(3),
                FruitCardItem(2),
                FruitCardItem(1),
                FruitCardItem(0),
              ],
            ),
          )

        ],

      )
    );
  }
}

class FruitCardItem extends StatelessWidget {
    var index;
    FruitCardItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitDetailPage(index)));
      },

        child: Stack(
          children: [
            Container(
              height: 125.0,
              width: 125.0,
            ),

            Positioned(
                left: 15.0,
                child: Container(
                  height: 20.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                      color: Color(0xFFD2691F),
                      borderRadius: BorderRadius.circular(7.0)
                  ),
                )
            ),
            Positioned(
                top: 7.0,
                child: Container(
                    height: 110.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFAAC2A5),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          Image.asset(
                            listOfFruits[index].imgPath,
                            fit: BoxFit.cover,
                            height: 70.0,

                          ),
                          Text(
                              "\$${listOfFruits[index].price}",
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          ),
                        ]
                    )
                )
            ),
            Positioned(
                left: 15.0,
                child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFFE9741),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(7.0), bottomRight: Radius.circular(7.0), bottomLeft: Radius.circular(7.0))
                    ),
                    child: Center(
                        child: Text(
                            '%',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 9.0,
                                color: Colors.white
                            )
                        )
                    )
                )
            ),

          ]
        ),
      )
    );

  }
}
