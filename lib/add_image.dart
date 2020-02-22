import 'package:flutter/material.dart';
import 'package:flutter_py/api_testing.dart';
import 'package:flutter_py/models.py.dart';

class AddImage extends StatefulWidget {
  AddImage({Key key}) : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  TextEditingController name = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController image = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black),
            controller: name,
            decoration: InputDecoration(
              hintText: "Name",
              hintStyle:  TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black),
              controller: rating,
              decoration: InputDecoration(
                  hintText: "rating",
                  hintStyle:  TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),
              ),
            ),
          ),
          FlatButton(
            color: Colors.blue,
              onPressed: () async{
             Stores newStore = Stores(name: name.text, ratings: rating.text, image: "https://i.udemycdn.com/course/750x422/2560534_54a5_2.jpg");
             Stores st = await createPost(url,body: newStore.toStores());
             print(st.name);
          }, child: Text("Save"))
        ],
      ),
    );
  }
}