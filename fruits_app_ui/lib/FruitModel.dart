
import 'package:flutter/material.dart';

class Fruit{

  String name;
  String shDes;
  String lgDes;
  double rating;
  String price;
  Color bgColor;
  String imgPath;


  Fruit(this.name, this.shDes, this.lgDes, this.rating, this.price, this.bgColor, this.imgPath);


}


List<Fruit> listOfFruits=[

  Fruit("Avocado", "They are a rich, smooth buttery fruit and are nutritious. Indian avocado has a little more nutty flavour than the imported avocados", "Premium Avocado is the rich source of the potassium. Fiber is another nutrient found in the avocado. Eating avocado helps to lower the cholesterol.It may help to prevent cancer. Avocados are a great source of vitamins C, E, K, and B-6, as well as riboflavin, niacin, folate, pantothenic acid, magnesium, and potassium.",
      4, "18.8",Color(0xff1b4314),"assets/avocado.png" ),
  Fruit("Grapes", " Green grapes are elongated in size, have a thin skin and have a sweet taste.", "Green grapes are chosen for it's sweet, juicy flavour that can be enjoyed straight from the bunch. Try them mixed into a fruit salad, on top of your morning muesli, or as a pop of colour in your favourite dessert",
4.5, "8.5", Color(0xff88A93D),"assets/grapes.png"),
  Fruit("Dragon Fruit", "Dragon fruits are medium sized pink coloured fruits, with a white juicy flesh with tiny black seeds. The flesh is moderately sweet, with a crunchy texture due to the seeds.","Dragon fruits are oval to oblong in shape and size, with pink peel and green scale-like leaves. It is named after its resemblance to dragon scales. White flesh is dotted with black, tiny edible seeds. It has juicy and spongy flesh with sweet flavour and a hint of sourness. Fresho dragon fruits are sourced from Thailand.",
      3.8, "15.65", Color(0xffF82457),"assets/dragon-fruit.png"),
  Fruit("Strawberry", "Strawberries are heart shaped fruits with tiny white seeds on the outside. The flesh is normally sweet and slightly tart.",
      "It has been suggested that several commercial farms tend to use chemicals like 1,3-Dichloropropene (1,3-D), chloropicrin, penthiopyrad, iprodione and trifloxystrobin. Studies indicate that these could lead to coughing, choking, shortness of breath, nausea and vomiting",
      4.2, "12.68", Color(0xffDC3545),"assets/strawberry.png" ),
];

