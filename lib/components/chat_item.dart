import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mystore/Inbox/components/conversation.dart';
import 'package:mystore/components/text_time.dart';
import 'package:mystore/firebaseService/FirebaseService.dart';
import 'package:mystore/models/User.dart';
import 'package:mystore/models/enum/message_type.dart';
import 'package:mystore/utils/firebase.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatItem extends StatelessWidget {
  final String userId;
  final Timestamp time;
  final String msg;
  final int messageCount;
  final String chatId;
  final MessageType type;
  final String currentUserId;

  ChatItem({
    Key key,
    @required this.userId,
    @required this.time,
    @required this.msg,
    @required this.messageCount,
    @required this.chatId,
    @required this.type,
    @required this.currentUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: usersRef.doc('$userId').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DocumentSnapshot documentSnapshot = snapshot.data;
          UserModel user = UserModel.fromJson(documentSnapshot.data());

          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        firebaseAuth.currentUser.photoURL ??
                            FirebaseService().getProfileImage()),
                    radius: 25.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      height: 15,
                      width: 15,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: user?.isOnline ?? false
                                ? Color(0xff00d72f)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          height: 11,
                          width: 11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                '${user.username}',
                maxLines: 1,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Text(
                type == MessageType.IMAGE ? "IMAGE" : "$msg",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 10),
                  TextTime(
                    child: Text(
                      "${timeago.format(time.toDate())}",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 11,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 5),
                  buildCounter(context),
                ],
              ),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Conversation(
                        userId: userId,
                        chatId: chatId,
                      );
                    },
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  buildCounter(BuildContext context) {
    return StreamBuilder(
      stream: messageBodyStream(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          DocumentSnapshot snap = snapshot.data;
          Map usersReads = snap.data()['reads'] ?? {};
          int readCount = usersReads[currentUserId] ?? 0;
          int counter = messageCount - readCount;
          if (counter == 0) {
            return SizedBox();
          } else {
            return Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: BoxConstraints(
                minWidth: 11,
                minHeight: 11,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 1, left: 5, right: 5),
                child: Text(
                  "$counter",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        } else {
          return SizedBox();
        }
      },
    );
  }

  Stream<DocumentSnapshot> messageBodyStream() {
    return chatRef.doc(chatId).snapshots();
  }
}
