import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/Inbox/components/recent_chats.dart';
import 'package:mystore/components/notification_items.dart';
import 'package:mystore/models/notification.dart';
import 'package:mystore/utils/firebase.dart';

import 'components/notification_stream_wrapper.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  int pageIndex = 0;
  currentUserId() {
    return firebaseAuth.currentUser.uid;
  }

  final tab = new TabBar(tabs: <Tab>[
    new Tab(icon: new Icon(CupertinoIcons.chat_bubble_text)),
    new Tab(icon: new Icon(CupertinoIcons.chat_bubble_2_fill)),
  ]);

  Widget getBody2() {
    return Scaffold(
        appBar: new PreferredSize(
      preferredSize: tab.preferredSize,
      child: new Card(
        elevation: 26.0,
        color: Theme.of(context).primaryColor,
        child: tab,
      ),
    ));
  }

  List<Widget> containers = [
    Scaffold(
      body: ListView(
        children: [
          ActivityStreamWrapper(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              stream: notificationRef
                  .doc(firebaseAuth.currentUser.uid)
                  .collection('notifications')
                  .orderBy('timestamp', descending: true)
                  .limit(20)
                  .snapshots(),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, DocumentSnapshot snapshot) {
                ActivityModel activities =
                    ActivityModel.fromJson(snapshot.data());
                return ActivityItems(
                  activity: activities,
                );
              })
        ],
      ),
    ),
    Chats(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 20, 10, 10),
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
              Chats(),
            ],
          ),
        ),
      ),
    );
  }

  deleteAllItems() async {
//delete all notifications associated with the authenticated user
    QuerySnapshot notificationsSnap = await notificationRef
        .doc(firebaseAuth.currentUser.uid)
        .collection('notifications')
        .get();
    notificationsSnap.docs.forEach((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }
}
