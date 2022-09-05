import 'package:flutter/material.dart';
import 'package:flutter_demo/guide/07/provider/cart_model.dart';
import 'package:flutter_demo/guide/07/provider/change_notifier_provider.dart';
import 'package:flutter_demo/guide/07/provider/consumer.dart';

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({Key? key}) : super(key: key);

  @override
  State<ProviderRoute> createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("07.功能型组件"),
        ),
        body: Center(
          child: ChangeNotifierProvider<CartModel>(
            data: CartModel(),
            //为什么加一层Builder？,Builder 是什么？
            child: Builder(
              builder: (context) {
                return Column(
                  children: <Widget>[
                    //优化后
                    Consumer<CartModel>(builder: (context, cart) {
                      return Text("总价: ${cart?.totalPrice}");
                    }),
                    //优化前
                    /*Builder(builder: (context){
                  var cart = ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价: ${cart.totalPrice}");
                }),*/
                    Builder(builder: (context) {
                      print("ElevatedButton build"); //在后面优化部分会用到
                      return ElevatedButton(
                        child: Text("添加商品"),
                        onPressed: () {
                          //给购物车添加商品，添加后总价会更新
                          ChangeNotifierProvider.of<CartModel>(context,
                                  listen: false)
                              .add(Item(20.0, 1));
                        },
                      );
                    })
                  ],
                );
              },
            ),
          ),
        ));
  }
}
