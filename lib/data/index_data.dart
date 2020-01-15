import 'package:fruit_shop/model/index_fruits_model.dart';
import 'package:fruit_shop/model/index_product_model.dart';

class IndexData{


  static List<IndexProductModel> productDummyData = [
    new IndexProductModel(1,'گوجه', '۲۰۰۰ تومان', 'assets/gooje.png',2000),
    new IndexProductModel(2,'هویج', '۱۰۰۰ تومان', 'assets/havi.png',1000),
    new IndexProductModel(3,'موز', '۳۰۰۰ تومان', 'assets/moz.png',3000),
    new IndexProductModel(4,'انار', '۷۰۰ تومان', 'assets/anar.png',700),
    new IndexProductModel(5,'پرتقال', '۱۲۰۰ تومان', 'assets/por.png',1200),
    new IndexProductModel(7,'گوجه', '۲۰۰۰ تومان', 'assets/gooje.png',2000),
    new IndexProductModel(8,'هویج', '۱۰۰۰ تومان', 'assets/havi.png',1000),
    new IndexProductModel(9,'موز', '۳۰۰۰ تومان', 'assets/moz.png',3000),
  ];

  static List<IndexFruitModel> fruitDummyData = [
    new IndexFruitModel('assets/havipor.svg'),
    new IndexFruitModel('assets/salad.svg'),
    new IndexFruitModel('assets/panir.svg'),
    new IndexFruitModel('assets/steak.svg'),
    new IndexFruitModel('assets/bread.svg'),
  ];

}