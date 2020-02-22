import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_py/add_image.dart';
import 'package:flutter_py/api_testing.dart';
import 'package:flutter_py/show.dart';

import 'models.py.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text('Stores',style: TextStyle(color: Colors.black,fontSize: 30),),
    ),
    body:  FutureBuilder<List<Stores>>(
        future :fetchStores(http.Client()),
        builder: (context,snapshot){
          print(snapshot.data);
        if (snapshot.hasData) {
          print(snapshot.data);
          return PhotosList(photos: snapshot.data);
        }  else if (snapshot.hasError) {
          Center(
              child :Text(snapshot.error)
          );
        }
        return CircularProgressIndicator();
    }),  
    floatingActionButton: FloatingActionButton(
        child: Center(child: Icon(Icons.add, color: Colors.white,),),
        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddImage()))
        ),
    );
  }
}


class PhotosList extends StatelessWidget {
  final List<Stores> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Padding(padding: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Show(stores: photos[index],),)),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(image: NetworkImage(photos[index].image,),fit: BoxFit.cover)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(photos[index].name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                )
        ],
        )
        ),));
      }
    );
  }
}