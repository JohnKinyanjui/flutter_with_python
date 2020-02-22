import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_py/api_testing.dart';
import 'package:flutter_py/models.py.dart';
import 'package:http/http.dart' as http;

class Show extends StatefulWidget {
  final Stores stores;

  const Show({Key key, this.stores}) : super(key: key);
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
               width: double.infinity,
                child: Image(image: NetworkImage(widget.stores.image),fit: BoxFit.cover,)),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: FutureBuilder<List< Stores>>(
               future:  fetchStores(http.Client()),
               builder:(context,snapshot){
                 if (snapshot.hasData) {
                   return Item_Widget(snapshot.data);
                 }
                 return Center(child: CircularProgressIndicator());
              }),
            )
          ],
        ),
      ),
    );
  }
}


class Item_Widget extends StatelessWidget {
  List<Stores> stores;
  Item_Widget(this.stores);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: stores.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(stores[index].items[index].item_image),fit: BoxFit.cover),
            ),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Text(stores[index].items[index].item_name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        );
      },
    );
  }
}
