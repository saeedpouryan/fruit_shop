import 'package:flutter/material.dart';
import 'package:fruit_shop/model/basket_model.dart';
import 'package:fruit_shop/model/index_product_model.dart';

class BasketProvider with ChangeNotifier{

  List<BasketModel> basket = [];
  int fruitCount = 0;

  void initFruitCount(int id){

    // این متغیر برای چک کردن میوه در سبد هست یا نه.. که اگر میوه وجود نداشت مقدار ۰ در متغیر میگذارد
    bool isFruit = false;

    basket.forEach((item){
      if(item.id == id){
        fruitCount = item.fruitCount;
        isFruit = true;
       ///notifyListeners();
      }
    });

    if(!isFruit){
      fruitCount = 0;
    }
  }

  void increment(IndexProductModel data){
    bool fruitInBasket = false;

    basket.forEach((item){
      if(item.id == data.id){
        item.fruitCount++;
        fruitCount = item.fruitCount;
        fruitInBasket = true;
        notifyListeners();
      }
    });

    if(!fruitInBasket){

      print('fruit added to basket');

      basket.add(
        new BasketModel(data.id, data.price, 1)
      );
      fruitCount = 1;
      notifyListeners();
    }
  }

  void decrement(IndexProductModel data){

    bool removeFruit = false;

    basket.forEach((item){
      if(item.id == data.id){
        if(item.fruitCount >= 1){

          item.fruitCount--;
          fruitCount = item.fruitCount;

          if(item.fruitCount == 0){
            removeFruit = true;
          }

          notifyListeners();
        }
      }
    });

    if(removeFruit) {
      basket.removeWhere((item) => item.id == data.id);
    }

  }


  int sum(int price){
    return price * fruitCount;
  }

}