import 'package:fruit_shop/data/index_data.dart';
import 'package:fruit_shop/model/index_fruits_model.dart';
import 'package:fruit_shop/model/index_product_model.dart';

class IndexModel{
  IndexData indexData = new IndexData();

  List<IndexProductModel> getAllProduct(){
    return IndexData.productDummyData;
  }

  List<IndexFruitModel> getAllFruit(){
    return IndexData.fruitDummyData;
  }
}