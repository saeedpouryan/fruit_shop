import 'package:fruit_shop/architecture_index/model/index_model.dart';
import 'package:fruit_shop/architecture_index/view/index_view.dart';

class IndexPresenter{

  IndexModel indexModel = new IndexModel();
  IndexView indexView;

  IndexPresenter(IndexView view){
    indexView = view;
  }


  void getAllProduct(){
    var res = indexModel.getAllProduct();

    indexView.onSuccessProduct(res);
  }

  void getAllFruit(){
    var res = indexModel.getAllFruit();

    indexView.onSuccessFruit(res);
  }
}