import 'package:fruits_app_ui/FruitModel.dart';

class CartModel {
  Fruit fruit;
  int quantity;

  CartModel(this.fruit, this.quantity);

}



List<CartModel> cartItems=[];