import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_shop/architecture_index/model/index_model.dart';
import 'package:fruit_shop/architecture_index/presenter/index_presenter.dart';
import 'package:fruit_shop/architecture_index/view/index_view.dart';
import 'package:fruit_shop/model/index_fruits_model.dart';
import 'package:fruit_shop/model/index_product_model.dart';
import 'package:fruit_shop/page/fruit_shop_single.dart';
import 'package:fruit_shop/provider/index_provider.dart';
import 'package:provider/provider.dart';

class FruitShopIndex extends StatelessWidget implements IndexView{

  IndexPresenter indexPresenter;
  List<IndexProductModel> listProduct = [];
  List<IndexFruitModel> listFruit = [];
  Size screenSize;
  int currentClickFruit = 0;

  FruitShopIndex(){
    indexPresenter = new IndexPresenter(this);
    indexPresenter.getAllProduct();
    indexPresenter.getAllFruit();
  }

  @override
  Widget build(BuildContext context) {

    var indexPro = Provider.of<IndexProvider>(context,listen: false);
    screenSize = MediaQuery.of(context).size;

    return new Directionality(
      textDirection: TextDirection.rtl,
      child: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: new Text(
            'میوه',
            style: TextStyle(
                color: Color(0xff0fabbc),
                fontFamily: 'IRANYekanMobileMedium'
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 24),
                child: SvgPicture.asset('assets/group_10.svg')
            )
          ],
        ),
        body: new NestedScrollView(
          headerSliverBuilder: (context,bol){
            return [
              new SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: screenSize.height* .23,
                flexibleSpace: FlexibleSpaceBar(
                  background: new Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(top: screenSize.height * .035),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        width: screenSize.width * .88,
                        height: 55,
                        child: new TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search,color: Color(0xffa7b6ba),),
                            hintText: 'اینجا جستجو کنید...',
                            hintStyle: TextStyle(
                              color:  Color(0xffa7b6ba)
                            )
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfff9f9f9),
                          borderRadius: BorderRadius.circular(15),

                        ),
                      ),
                      new SizedBox(
                        height: screenSize.height* .028,
                      ),
                      new Container(
                        width: screenSize.width,
                        height: screenSize.height * .1,
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listFruit.length,
                          itemBuilder: (context,index){
                            return new Consumer<IndexProvider>(
                              builder: (context,indexProvider,child) => new GestureDetector(
                                onTap: (){
                                  indexProvider.setNewValue(index);
                                },
                                child: new Container(
                                  padding: EdgeInsets.all(14),
                                  margin: index == 0
                                      ? EdgeInsets.only(
                                      top: 8,
                                      bottom: 8,
                                      right: screenSize.width * .06,
                                      left: 8
                                  )
                                      : EdgeInsets.all(8),
                                  width: screenSize.width * .2,
                                  height: screenSize.width * .1,
                                  child: new SvgPicture.asset(
                                    listFruit[index].fruitImage,
                                    width: screenSize.width * .02,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xffe4f9ff),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: indexProvider.currentClickFruit == index ? Color(0xff12cad6) : Colors.transparent,
                                          width: 1.5
                                      )
                                  ),
                                ),
                              )
                            );
                          }
                        ),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          
          body: new ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: listProduct.length,
            itemBuilder: (context,index){
              return new GestureDetector(
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context)=> new FruitShopSingle(
                    new IndexProductModel(listProduct[index].id,listProduct[index].fruitName, listProduct[index].fruitPrice, listProduct[index].fruitImage,listProduct[index].price)
                  )));
                },
                child: new Container(
                  margin: EdgeInsets.only(right: 32,top: 12,bottom: 12),
                  height: screenSize.height * .13,
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        width: screenSize.width * .83,
                        height: screenSize.height * .13,
                        child: new Row(
                          children: <Widget>[
                            new Hero(
                              tag: 'fruitImage${listProduct[index].id}',
                              child: new Image(
                                image: AssetImage(
                                  listProduct[index].fruitImage,
                                ),
                                width: screenSize.width * .2,
                              )
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfff9f9f9),
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      new SizedBox(
                        width: 12,
                      ),
                      new Container(
                        margin: EdgeInsets.only(right: screenSize.width * .3),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              listProduct[index].fruitName,
                              style: TextStyle(
                                color: Color(0xff0d282f),
                                fontSize: screenSize.width * .042
                              ),
                            ),
                            new SizedBox(
                              height: 12,
                            ),
                            new Text(
                              listProduct[index].fruitPrice,
                              style: TextStyle(
                                  color: Color(0xff0fabbc),
                                  fontSize: screenSize.width * .042
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Positioned(
                        left: screenSize.width * .045,
                        top: screenSize.height * .04,

                        child: new GestureDetector(
                          onTap: (){

                          },
                          child: new Container(
                            width: screenSize.width * .1,
                            height: screenSize.width * .1,
                            child: new Icon(Icons.add,color: Colors.white,size: 30,),
                            decoration: BoxDecoration(
                              color: Color(0xff12cad6),
                              borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        )
      ),
    );
  }

  @override
  void onError(error) {

  }

  @override
  void onSuccessProduct(response) {
    listProduct = response;
  }

  @override
  void onSuccessFruit(response) {
    listFruit = response;
  }
}
