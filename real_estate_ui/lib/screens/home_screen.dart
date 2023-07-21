import 'package:flutter/material.dart';
import 'package:real_estate_app_ui/data/sample_data.dart';
import 'package:real_estate_app_ui/screens/property_info_screen.dart';
import 'package:real_estate_app_ui/widgets/border_box.dart';
import 'package:real_estate_app_ui/widgets/optonbutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25,left: 25,right: 25,bottom: 25),
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BorderBox(
                        height: 50,
                        width: 50,
                          child: Icon(Icons.menu)),
                      BorderBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.settings)),
                    ],
                  ),
                ),
               const  Padding(
                 padding: EdgeInsets.symmetric(horizontal: 25),
                  child:  Text("City",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text("San Francisco",
                  style: TextStyle(
                    color: Color.fromRGBO(47, 48, 47, 1),
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                  ),
                ),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(

                    color: Colors.grey,

                  ),
                ),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        "\$200,000","For Sale","3-4 Beds","5000 sqft"].
                      map((e) => ChoiceOption(text: e)).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: ListView.builder(
                      itemCount: Data.length,
                        itemBuilder: (context,index){
                          return PropertyTile(itemData: Data[index],);
                        }),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
                child: OptionButton(text:"Map View", icon:Icons.map, width: MediaQuery.of(context).size.width*.35)),
          ],
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:const  Color.fromRGBO(141,141,141,.15),
      ),
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 13),
        child: Text(text,
        style:const TextStyle(
          color: Color.fromRGBO(47, 48, 47, 1),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ) ,),
      ),

    );
  }
}

class PropertyTile extends StatelessWidget {
  final dynamic itemData;

  const PropertyTile({Key? key,required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyInfo(itemData: itemData,)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                  child: Image(image: AssetImage(itemData["image"]))),
            const Positioned(
              top: 15,
               right: 15,
               child: BorderBox(child: Icon(
                 Icons.favorite_border,
                 color: Color.fromRGBO(47, 48, 47, 1),
               ),
                height:50 ,
                width:50 ,
               ),
             )
            ],),
            const SizedBox(
              height: 15,
            ),
            Row(
              children:  [
                Text("\$"+itemData["amount"].toString(),
                style: const TextStyle(
                  color: Color.fromRGBO(47, 48, 47, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),),
                Text("  "+itemData["address"],
                style:const  TextStyle(
                    color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),),
              ],
            ),
            const SizedBox(height: 5,),
            Text("${itemData["bedrooms"]} bedrooms | ${itemData["bathrooms"]} bathrooms | ${itemData["area"]} sqft ",
            style:const TextStyle(
              color: Color.fromRGBO(47, 48, 47, 1),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),),

          ],
        ),
      ),
    );
  }
}
