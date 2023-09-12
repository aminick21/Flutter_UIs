
class OnBoardingModel{
 String imagePath;
 String pawPath;
 String heading;
 String bodyText;

 OnBoardingModel(this.imagePath, this.pawPath, this.heading, this.bodyText);

}


List<OnBoardingModel> onBoardingItemList=[
  OnBoardingModel('assets/cat.png', 'assets/count1.png', 'Proud to Be a Pet\nAdopter',"Looking for unconditional love?\nvisit the shelter today" ),
  OnBoardingModel('assets/dog1.png', 'assets/count2.png', 'Choose Dress',"Check our fastest fashion collection for your most loyal friend" ),
  OnBoardingModel('assets/dog2.png', 'assets/count3.png', "Get interesting promos here", "Get interesting promos here, register your account immediately." )

];