import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'queries_event.dart';
part 'queries_state.dart';

class QueriesBloc extends Bloc<QueriesEvent, QueriesState> {
  Map<String, int> _mL = {};
  String _currentUser = "UID1";
  String _currentUserName = "Juan";

  Map<String, int> get getML => _mL;
  String get getCurrentUser => _currentUser;

  QueriesBloc() : super(QueriesInitial()) {
    on<GetMessagesEvent>(_getMessageEvent);
    on<CreateChatEvent>(_createChatEvent);
    on<CreateMessageEvent>(_createMessageEvent);
    on<ChangeViewEvent>(_changeViewEvent);
    on<RegisterEvent>(_registerEvent);
    on<LoginEvent>(_loginEvent);
  }

  FutureOr<void> _changeViewEvent(ChangeViewEvent event, Emitter emit) async {
    emit(ChangeViewRegisterState());
  }

  FutureOr<void> _registerEvent(RegisterEvent event, Emitter emit) async {
    emit(LoadingState());

    if (event.name != "" && event.email != "" && event.password != "") {
      try {
        var docRef = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        print(docRef.user!.uid);

        var newUser = {
          "UID": docRef.user!.uid,
          "name": event.name,
        };

        await FirebaseFirestore.instance.collection('users').add(newUser);

        _currentUser = docRef.user!.uid;
        _currentUserName = event.name;

        emit(LoginSuccessState());
      } catch (e) {
        print(e);
      }
    }
  }

  FutureOr<void> _loginEvent(LoginEvent event, Emitter emit) async {
    emit(LoadingState());

    if (event.email != "" && event.password != "") {
      try {
        var docRef = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email, password: event.password);

        var userInfo = await FirebaseFirestore.instance
            .collection('users')
            .where("UID", isEqualTo: "${docRef.user!.uid}")
            .get();

        _currentUser = userInfo.docs.first.data()["UID"];
        _currentUserName = userInfo.docs.first.data()["name"];

        emit(LoginSuccessState());
      } catch (e) {}
    }
  }

  FutureOr<void> _getMessageEvent(GetMessagesEvent event, Emitter emit) async {
    var total = await FirebaseFirestore.instance
        .collection("chats/" + event.chatId + "/messages")
        .get();

    _mL.addAll({"${event.chatId}": total.docs.length});

    emit(GetMessagesSuccesState());
  }

  FutureOr<void> _createChatEvent(CreateChatEvent event, Emitter emit) async {
    if (event.friendId != "" && event.firstMessage != "") {
      var newChat = {
        "chatters": [_currentUser, event.friendId],
        "createdAt": DateTime.now(),
        "lastModifiedAt": DateTime.now()
      };

      var docRef =
          await FirebaseFirestore.instance.collection('chats').add(newChat);

      var newMessage = {
        "content": {"text": event.firstMessage},
        "createdAt": DateTime.now(),
        "senderId": _currentUser,
        "senderName": _currentUserName
      };

      await FirebaseFirestore.instance
          .collection('chats')
          .doc(docRef.id)
          .collection("messages")
          .add(newMessage);

      emit(CreateChatSuccessState());
      add(GetMessagesEvent(chatId: docRef.id));
    }
  }

  FutureOr<void> _createMessageEvent(
      CreateMessageEvent event, Emitter emit) async {
    if (event.newMessage != "" && event.chatId != "") {
      var newMessage = {
        "content": {"text": event.newMessage},
        "createdAt": DateTime.now(),
        "senderId": _currentUser,
        "senderName": _currentUserName
      };

      await FirebaseFirestore.instance
          .collection('chats')
          .doc(event.chatId)
          .collection("messages")
          .add(newMessage);

      emit(CreateMessageSuccessState());
      add(GetMessagesEvent(chatId: event.chatId));
    }
  }
}
