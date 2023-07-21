
import 'package:flutter/material.dart';
import 'package:starbucks_ui/colors.dart';

class Drink{
 String name;
 String price;
 String conName;
 String backgroundImage;
 String imageTop;
 String imageSmall;
 String imageBlur;
 String cupImage;
 String desc;
 Color lightColor;
 Color darkColor;

 Drink(
      this.name,
      this.price,
      this.conName,
      this.backgroundImage,
      this.imageTop,
      this.imageSmall,
      this.imageBlur,
      this.cupImage,
      this.desc,
      this.lightColor,
      this.darkColor);


}

List<Drink> listOfDrinks=[

   Drink(
   'Tirami',
   '4.70',
   'Sù',
   'images/blur_image.png',
   'images/bean_top.png',
   'images/bean_small.png',
   'images/bean_blur.png',
   'images/cup.png',
   'then top with whipped cream and mocha drizzle to bring you endless \njava joy',
   mBrownLight,
   mBrown),

   Drink(
   'Green',
   '8.02',
   'Tea',
   'images/green_image.png',
   'images/green_top.png',
   'images/green_small.png',
   'images/green_blur.png',
   'images/green_tea_cup.png',
   'milk and ice and top it with sweetened whipped cream to give you \na delicious boost\nof energy.',
   greenLight,
   greenDark),

   Drink(
   'Triple',
   '6.78',
   'Mocha',
   'images/mocha_image.png',
   'images/chocolate_top.png',
   'images/chocolate_small.png',
   'images/chocolate_blur.png',
   'images/mocha_cup.png',
   'layers of whipped cream that’s infused with cold brew, white chocolate mocha and dark \ncaramel.',
   mBrownLight,
   mBrown),



];