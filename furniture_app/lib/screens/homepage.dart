import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/Categories.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/services/fetchCategories.dart';
import 'package:furniture_app/services/fetchProducts.dart';
import 'package:furniture_app/widgets/category_card.dart';
import 'package:furniture_app/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: SvgPicture.asset('assets/icons/menu.svg',
          height:20),),
        actions: [
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('assets/icons/scan.svg',
                height:25),),
          Center(
            child: Text("Scan",style: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // category title
           HeadingTitle(title: "Browse by Categories",),

          // category list
           SizedBox(  height:height/2.8,
            child: FutureBuilder(
               future: fetchCategories(),
                 builder: (context,snapshot){
               return snapshot.hasData?Categories(categories:snapshot.data!,) :Center(child: CircularProgressIndicator(),);
             }),
           ),

          //  recommended title
            HeadingTitle(title: "Recommended for You",),

          //  recommended list
            FutureBuilder(
                future: fetchProducts(),
                builder: (context,snapshot){
                  return snapshot.hasData?Products(products: snapshot.data!) :Container( height:300,child: Center(child: CircularProgressIndicator()));
                }),

          ],
        ),
      ),
    );
  }
}

class HeadingTitle extends StatelessWidget {
  const HeadingTitle({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.only(left: 15,top: 20),
       child: Text(title,
       style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 20

       ),),
     );
  }
}


class Categories extends StatelessWidget {
  const Categories({Key? key, required this.categories}) : super(key: key);
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
        child: Row(
          children:List.generate(categories.length, (index) =>CategoryCard(category: categories[index]) ),
        ),
      )

    );
  }
}


class Products extends StatelessWidget {
  const Products({Key? key, required this.products}) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .7,
            crossAxisSpacing: 10,
            mainAxisSpacing:10
      ), itemBuilder: (context,index){
          return ProductCard(product:products[index]);
      }),
    );
  }
}
