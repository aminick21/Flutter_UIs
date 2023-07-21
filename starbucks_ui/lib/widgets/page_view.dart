import 'package:flutter/cupertino.dart';
import 'package:starbucks_ui/model/drink.dart';
import 'package:starbucks_ui/widgets/cards.dart';





class BuildPages extends StatefulWidget {
  const BuildPages({Key? key}) : super(key: key);

  @override
  State<BuildPages> createState() => _BuildPagesState();
}

class _BuildPagesState extends State<BuildPages> {

final PageController _pageController=PageController(initialPage: 0,viewportFraction: .8,);
double pageOffset=0;


@override
  void initState() {
  _pageController.addListener(() {
    setState(() {
      pageOffset=_pageController.page!;
    });
  });
    super.initState();

  }


void dispose() {
  _pageController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      child: PageView.builder(
        itemBuilder: (context,index)=>DrinkCard(listOfDrinks[index],pageOffset,index),
        itemCount: listOfDrinks.length,
        controller: _pageController,
      ),
    );
  }
}
