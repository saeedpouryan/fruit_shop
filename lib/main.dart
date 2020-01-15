import 'package:flutter/material.dart';
import 'package:fruit_shop/provider/basket_provider.dart';
import 'package:fruit_shop/provider/index_provider.dart';
import 'package:provider/provider.dart';

import 'page/fruit_shop_index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => new IndexProvider(),
        ),

        ChangeNotifierProvider(
          create: (BuildContext context) => new BasketProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'میوه فروشی',
        theme: ThemeData(
          fontFamily: 'IRANYekanMobileMedium',
          primarySwatch: Colors.blue,
        ),
        home: FruitShopIndex(),
      ),
    );
  }
}

