import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import '../models/Product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key,required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: SvgPicture.asset('assets/icons/arrow-long-left.svg',
              height:15),),
        actions: [
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('assets/icons/bag.svg',
                height:25),),
          SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: height/2-50,
                color: kSecondaryColor,
              ),
              Positioned(
                left: 20,
                top: 50,
                child: SizedBox(
                  width: 120,
                  height: height/2-50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.category.toUpperCase(),style: TextStyle(),),
                      SizedBox(height: 15,),
                      Text(product.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                        ),),
                      SizedBox(height: 15,),
                      Text("Form",
                        style: TextStyle(
                        ),),
                      Text("\$"+product.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),),
                      SizedBox(height: 15,),
                      Text("Available Colors",
                        style: TextStyle(
                        ),),
                      Row(
                        children: [
                          CheckBoxWidget(color:Colors.green,check: true,),
                          CheckBoxWidget(color:Colors.grey,check: false,),
                          CheckBoxWidget(color:Colors.black,check: false,),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                  top: 150,
                  child: Hero(
                      tag: product.id,
                      child: Image.network(product.image,fit: BoxFit.cover,height:300,width: 300,))),
              Positioned(
                top: height/2-50,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: width,
                  height: height/2,
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Text(product.subTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),),
                      SizedBox(height: 20,),
                      Text(product.description,
                        style: TextStyle(
                          color: kTextColor.withOpacity(.7),
                          fontSize: 18,
                        ),),
                      SizedBox(height: 20,),
                      MaterialButton(
                        onPressed: (){},
                        child: const Text("Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        elevation: 0,
                        color: kPrimaryColor,
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    Key? key, required this.color, required this.check,
  }) : super(key: key);

  final Color color;
  final bool check;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      height: 25,width: 25,
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(6),
      ),
      child:check? SvgPicture.asset('assets/icons/check.svg',):SizedBox(),

    );
  }
}
