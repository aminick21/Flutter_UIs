import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/Product.dart';
import '../screens/product_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, Key? key}) : super(key: key);
final Product product;
  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width= MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(product:product)));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height:height/2,
            width:width/1.8,
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(20)
            ),),

          Positioned(
            top: 0,
            child:  Container(
              height:height/3-100,
              width:width/1.8,
              child: Hero(
                tag: product.id,
                child: Image.network(product.image,
                  loadingBuilder:(context,child,loadingProgress){
                    if(loadingProgress==null){
                      return child;
                    }
                    else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                  fit: BoxFit.contain,),
              ),
            ),),

          Positioned(
            bottom: 20,
            child: Column(
              children: [

                Text(product.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  ),),
                SizedBox(height: 10,),
                Text("\$"+ product.price.toString(),
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
