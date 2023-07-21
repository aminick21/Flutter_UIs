import 'package:flutter/material.dart';
import 'package:real_estate_app_ui/widgets/border_box.dart';
import 'package:real_estate_app_ui/widgets/optonbutton.dart';

class PropertyInfo extends StatelessWidget {
  final dynamic itemData;

  const PropertyInfo({Key? key,required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image(image: AssetImage(itemData["image"])),
                          Padding(
                            padding: const EdgeInsets.all(25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BorderBox(
                                    height: 50,
                                    width: 50,
                                    child: GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.chevron_left,size: 30,))),
                               const BorderBox(
                                    height: 50,
                                    width: 50,
                                    child: Icon(Icons.favorite_border)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\$"+itemData["amount"].toString(),
                                    style: const TextStyle(
                                      color: Color.fromRGBO(47, 48, 47, 1),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 26,

                                    )),
                                Text(itemData["address"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,

                                    )),
                              ],
                            ),
                            const Text("20 hours ago",
                            style: TextStyle(
                              color: Color.fromRGBO(47, 48, 47, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),),
                          ],
                        ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 25),
                        child:  Text("House Information",
                            style: TextStyle(
                              color: Color.fromRGBO(47, 48, 47, 1),
                              fontWeight: FontWeight.w500,
                              fontSize:16,

                            )),
                      ),
                      const SizedBox(height:25 ,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InfoTile(content: itemData["area"].toString(), text: "Square Foot",),
                            InfoTile(content: itemData["bedrooms"].toString(), text: "Bedrooms"),
                            InfoTile(content:itemData["bathrooms"].toString() , text: "Bathrooms"),
                            InfoTile(content: itemData["garage"].toString(), text: "Garage"),

                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Text(itemData["desc"],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          height: 1.5,
                        ),),
                      ),
                      const SizedBox(height: 80,)
                    ],
                  ),


                ],
              ),
            ),
            Positioned(
              bottom: 15,
              child: Row(
                children: const [
                  OptionButton(icon:Icons.mail,text: "Message",width:130,),
                  SizedBox(
                    width: 30,
                  ),
                  OptionButton(icon:Icons.phone,text: "Call",width:100,),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
 class InfoTile extends StatelessWidget {
final String content;
final String text;


  const InfoTile({Key? key,required this.content,required this.text}) : super(key: key);


   @override
   Widget build(BuildContext context) {
     return Container(
       margin:const EdgeInsets.only(left: 25),
       child: Column(
         mainAxisAlignment:MainAxisAlignment.center,
         children: [
           BorderBox(child: Text(content,
           style:const TextStyle(
             fontWeight: FontWeight.w500,
             fontSize: 20,
             color: Color.fromRGBO(47, 48, 47, 1),
           ),),
           height:MediaQuery.of(context).size.width*0.20 ,
             width: MediaQuery.of(context).size.width*.20,
           ),
          const SizedBox(
             height: 15,
           ),
           Text(text),

         ],
       ),

     );
   }
 }
