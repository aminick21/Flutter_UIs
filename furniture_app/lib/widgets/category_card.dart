import 'package:flutter/material.dart';
import 'package:furniture_app/screens/product_page.dart';

import '../constants.dart';
import '../models/Categories.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;


  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(  height:height/3,
              width:width/1.8,),
            Positioned(
              bottom:10,
              child: Container(
                height:height/4,
                width:width/1.8,

                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            Positioned(
              top: 0,
              child:  Container(
                  height:height/3-50,
                width:width/1.8,
                child: Image.network(category.image,
                loadingBuilder:(context,child,loadingProgress){
                  if(loadingProgress==null){
                    return child;
                  }
                  else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                },
                fit: BoxFit.contain,),
              ),),

            Positioned(
              bottom: 20,
              child: Column(
                children: [

                  Text(category.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),),
                  SizedBox(height: 10,),
                  Text(category.numOfProducts.toString()+"+ Products",
                    style: TextStyle(
                        color: Colors.grey[900]
                    ),),
                ],
              ),
            ),

          ],
        ),
    );
  }
}