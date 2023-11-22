import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queries_firebase/bloc/queries_bloc.dart';

class MessagesPage extends StatelessWidget {
  final String chatId;
  MessagesPage({super.key, required this.chatId});

  var newMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages from chat'),
      ),
      body: ListView(
        children: [
          Container(
            height: 680,
            child: FirestoreListView(
              padding: EdgeInsets.symmetric(horizontal: 18),
              pageSize: 15,
              query: FirebaseFirestore.instance
                  .collection("chats/" + chatId + "/messages"),
              itemBuilder: (
                BuildContext context,
                QueryDocumentSnapshot<Map<String, dynamic>> message,
              ) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.deepPurple[900],
                    onPressed: () {},
                    child: ListTile(
                      title: Text("${message.data()["content"]["text"]}"),
                      subtitle: Text("${message.data()["senderName"]}"),
                      leading: BlocProvider.of<QueriesBloc>(context)
                                  .getCurrentUser ==
                              message.data()["senderId"].toString()
                          ? CircleAvatar(
                              child: Text("${message.data()["senderName"][0]}"),
                            )
                          : null,
                      trailing: BlocProvider.of<QueriesBloc>(context)
                                  .getCurrentUser !=
                              message.data()["senderId"].toString()
                          ? CircleAvatar(
                              child: Text("${message.data()["senderName"][0]}"),
                            )
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 350,
                child: TextField(
                  controller: newMessageController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    label: Text(
                      "  New Message",
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<QueriesBloc>(context).add(
                      CreateMessageEvent(
                        newMessage: newMessageController.text,
                        chatId: chatId,
                      ),
                    );
                  },
                  icon: Icon(Icons.send)),
            ],
          ),
        ],
      ),
    );
  }
}
