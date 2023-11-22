import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queries_firebase/bloc/queries_bloc.dart';
import 'package:queries_firebase/messages.dart';

class ChatsPage extends StatelessWidget {
  ChatsPage({super.key});

  var friendIdController = TextEditingController();
  var firstMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: FirestoreListView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        pageSize: 15,
        query: FirebaseFirestore.instance.collection("chats").where("chatters",
            arrayContainsAny: [
              BlocProvider.of<QueriesBloc>(context).getCurrentUser
            ]),
        itemBuilder: (
          BuildContext context,
          QueryDocumentSnapshot<Map<String, dynamic>> chat,
        ) {
          BlocProvider.of<QueriesBloc>(context)
              .add(GetMessagesEvent(chatId: chat.id));

          return BlocBuilder<QueriesBloc, QueriesState>(
            builder: (context, state) {
              if (state is GetMessagesSuccesState) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.blueGrey[800],
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MessagesPage(
                            chatId: chat.id,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text("ID: ${chat.id}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Messages: ${BlocProvider.of<QueriesBloc>(context).getML[chat.id]}"),
                          Text(
                              "LastModified: ${chat.data()["lastModifiedAt"].toDate()}"),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewChatDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showNewChatDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Chat'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: friendIdController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    label: Text(
                      "Friend Id",
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: firstMessageController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    label: Text(
                      "First Message",
                    ),
                    prefixIcon: Icon(
                      Icons.telegram,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Color.fromARGB(255, 19, 172, 157),
              child: Text(
                'Create',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                BlocProvider.of<QueriesBloc>(context).add(
                  CreateChatEvent(
                    friendId: friendIdController.text,
                    firstMessage: firstMessageController.text,
                  ),
                );

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
