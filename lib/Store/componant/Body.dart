import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/SizeConfig.dart';
import 'package:mystore/Store/store_details.dart';
import 'package:mystore/components/indicators.dart';
import 'package:mystore/components/rating_stars.dart';
import 'package:mystore/models/shop.dart';
import 'package:mystore/utils/firebase.dart';

import '../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController searchController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> shoplist = [];
  List<DocumentSnapshot> filteredShops = [];
  bool loading = true;
  double rating = 3.5;

  getShops() async {
    QuerySnapshot snap = await shopRef.get();
    List<DocumentSnapshot> doc = snap.docs;
    shoplist = doc;
    filteredShops = doc;
    setState(() {
      loading = false;
    });
  }

  search(String query) {
    if (query == "") {
      filteredShops = shoplist;
    } else {
      List userSearch = shoplist.where((userSnap) {
        Map user = userSnap.data();
        String userName = user['name'];
        return userName.toLowerCase().contains(query.toLowerCase());
      }).toList();

      setState(() {
        filteredShops = userSearch;
      });
    }
  }

  @override
  void initState() {
    getShops();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 100.0,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  "assets/images/coffee2.png",
                  width: 150.0,
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              right: -180.0,
              child: Image.asset(
                "assets/images/square.png",
              ),
            ),
            Positioned(
              child: Image.asset(
                "assets/images/drum.png",
              ),
              left: -70.0,
              bottom: -40.0,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: SizeConfig.screenHeight,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: ListView(children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(50, 30, 20, 0),
                      child: Text("Find Your Favourite Meal!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              CupertinoIcons.color_filter,
                              color: Colors.red,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(50.0),
                                child: TextFormField(
                                    cursorColor: black,
                                    controller: searchController,
                                    onChanged: (query) {
                                      search(query);
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons.search,
                                            color: Colors.grey, size: 30.0),
                                        contentPadding: EdgeInsets.only(
                                            left: 15.0, top: 15.0),
                                        hintText: 'Search Location',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ))),
                              ),
                            ),
                          ],
                        )),
                    buildShops()
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildShops() {
    if (!loading) {
      if (filteredShops.isEmpty) {
        return Container(
          height: 300,
          child: Center(
            child: Text("No Shop Found",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        );
      } else {
        return Container(
            child: ListView.builder(
          itemCount: filteredShops.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot doc = filteredShops[index];
            ShopModel shops = ShopModel.fromJson(doc.data());
            return ShopsCard(shops);
          },
        ));
      }
    } else {
      return Center(
        child: circularProgress(context),
      );
    }
  }

  ShopsCard(ShopModel shops) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StoreDetail(
                      shopModel: shops,
                    )));
      },
      child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          padding: EdgeInsets.fromLTRB(0, 2, 20, 2),
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 4),
                blurRadius: 30,
                color: Color(0xFFB0CCE1).withOpacity(0.40),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        shops.mediaUrl,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${shops.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(height: 4),
                  StarRating(
                    rating: rating,
                    color: Colors.yellow[700],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StoreDetail(
                                        shopModel: shops,
                                      )));
                        },
                        child: Card(
                            elevation: 4.0,
                            color: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "See more",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato-Regular.ttf',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.white70, size: 15.0)
                                ],
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }
}
