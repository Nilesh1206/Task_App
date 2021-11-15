import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile2.dart";
  final List<Map> collections = [
    {
      "title":"To-Do",
      "image": "todo1.jpg"
    },
    {
      "title":"In-Progress",
      "image":"prg.png"
    },
    {
      "title":"Done",
      "image":"done.png"
    },
    {
      "title":"Running",
      "image":"run.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.amber.shade300, Colors.amber.shade500]
              ),
            ),
          ),
          ListView.builder(
            itemCount: 7,
            itemBuilder: _mainListBuilder,
          ),
        ],
      ),
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if(index==0) return _buildHeader(context);
    if(index==1) return _buildSectionHeader(context);
    if(index==2) return _buildCollectionsRow();
    if(index==3) return Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
        // child: Text("Most liked posts",
        //     style: Theme.of(context).textTheme.headline6
        // )
    );
    // return _buildListItem();
  }

  // Widget _buildListItem() {
  //   return Container(
  //     color: Colors.white,
  //     padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(5.0),
  //       child: Image.asset("images/login4.png",width: 100,fit: BoxFit.cover,height: 100,),
  //     ),
  //   );
  // }

  Container _buildSectionHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("My Tasks", style: Theme.of(context).textTheme.headline6),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: (){},
            child: Text("Create new", style: TextStyle(color: Colors.blue),),
          )
        ],
      ),
    );
  }

  Container _buildCollectionsRow() {
    return Container(
      color: Colors.white,
      height: 250.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: collections.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              width: 150.0,
              height: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("images/${collections[index]['image']}",width: 150,fit: BoxFit.cover,)),
                  ),

                  Text(collections[index]['title'], style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.grey.shade600)))
                ],
              )
          );
        },
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 240.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(

              shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.0,),
                  Text("Prathmesh Jadhav", style: Theme.of(context).textTheme.headline6,),
                  SizedBox(height: 5.0,),
                  Text("Backend Designer | Developer"),
                  SizedBox(height: 16.0,),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text("15",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text("Reputition".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0) ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text("10.3K",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text("Followers".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0) ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text("120",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text("Following".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0) ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  child:Image.asset("images/lg4.png",width: 60,),radius: 40,   backgroundColor: Colors.white, ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}