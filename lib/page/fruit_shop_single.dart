import 'package:flutter/material.dart';
import 'package:fruit_shop/model/index_product_model.dart';
import 'package:fruit_shop/provider/basket_provider.dart';
import 'package:provider/provider.dart';

class FruitShopSingle extends StatelessWidget {

  IndexProductModel data;
  Size screenSize;
  int fruitCount = 1;

  FruitShopSingle(this.data);
  
  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;
    var basketPro = Provider.of<BasketProvider>(context,listen: false);
    basketPro.initFruitCount(data.id);

    return new Directionality(
      textDirection: TextDirection.rtl,
      child: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: new GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: new Icon(Icons.arrow_back_ios,color: Colors.black.withOpacity(.6),),
          ),
          actions: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: new GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: new Icon(Icons.bookmark_border,color: Colors.black.withOpacity(.6),size: 28,),
              ),
            )
          ],
        ),
        body: new Stack(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                new SizedBox(width: screenSize.width,),
                new Container(
                  padding: EdgeInsets.all(16),
                  width: screenSize.width * .85,
                  height: screenSize.height * .4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Color(0xffe4f9ff),
                        Colors.white,
                      ]
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: new Hero(
                    tag: 'fruitImage${data.id}',
                    child: new Image(
                      image: AssetImage(data.fruitImage),
                    ),
                  )
                ),
                new Container(
                  margin: EdgeInsets.only(
                    left: 32,
                    right: 32,
                    top: 20
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        data.fruitName,
                        style: TextStyle(
                          color: Color(0xff0d282f),
                          fontSize: screenSize.width * .05
                        ),
                      ),
                      new Text(
                        data.fruitPrice,
                        style: TextStyle(
                            color: Color(0xff0fabbc),
                            fontSize: screenSize.width * .05
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(
                      left: 32,
                      right: 32,
                      top: 20
                  ),
                  child: new Text(
                    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد.',
                    style: TextStyle(
                      color: Color(0xff0d282f).withOpacity(.85),
                      fontSize: screenSize.width * .042,
                      height: 1.3
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
            new GestureDetector(
              onVerticalDragEnd: (d){
                print(d.primaryVelocity);
              },
              child: new Align(
                alignment: Alignment.bottomCenter,
                child: new Container(
                  width: screenSize.width,
                  height: screenSize.height * .3,
                  decoration: BoxDecoration(
                    color: Color(0xffe4f9ff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 16,
                        spreadRadius: 16
                      )
                    ]
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        margin: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                        width: screenSize.width,
                        height: screenSize.height * .07,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new GestureDetector(
                              onTap: (){
                                basketPro.decrement(data);
                              },
                              child: new Container(
                                width: screenSize.width * .12,
                                height: screenSize.width * .12,
                                child: new Icon(Icons.remove,color: Colors.white,size: 27,),
                                decoration: BoxDecoration(
                                  color: Color(0xff12cad6),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                            ),

                            new Consumer<BasketProvider>(
                              builder: (context,basketProvider,child){
                                return new Text(
                                  basketProvider.fruitCount.toString(),
                                  style: TextStyle(
                                      color: Color(0xff0d282f),
                                      fontSize: screenSize.width * .05
                                  ),
                                );
                              }
                            ),

                            new GestureDetector(
                              onTap: (){
                                basketPro.increment(data);
                              },
                              child: new Container(
                                width: screenSize.width * .12,
                                height: screenSize.width * .12,
                                child: new Icon(Icons.add,color: Colors.white,size: 27,),
                                decoration: BoxDecoration(
                                    color: Color(0xff12cad6),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfff9f9f9),
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),

                      new Consumer<BasketProvider>(
                        builder: (context,basketProvider,child) {
                          return new Text(
                            '${basketProvider.sum(data.price).toString()} تومان',
                            style: TextStyle(
                              fontSize: screenSize.width * .055,
                              color: Colors.black.withOpacity(.55)
                            ),
                          );
                        }
                      ),

                      new Container(
                        margin: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                        width: screenSize.width,
                        height: screenSize.height * .065,
                        alignment: Alignment.center,
                        child: new Text(
                          'افزودن به سبد خرید',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width * .045
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff12cad6),
                          borderRadius: BorderRadius.circular(15)
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
