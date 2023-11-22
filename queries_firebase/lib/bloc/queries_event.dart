part of 'queries_bloc.dart';

sealed class QueriesEvent extends Equatable {
  const QueriesEvent();

  @override
  List<Object> get props => [];
}

class GetMessagesEvent extends QueriesEvent {
  final String chatId;

  GetMessagesEvent({required this.chatId});

  @override
  List<Object> get props => [this.chatId];
}

class CreateChatEvent extends QueriesEvent {
  final String friendId;
  final String firstMessage;

  CreateChatEvent({required this.friendId, required this.firstMessage});

  @override
  List<Object> get props => [this.friendId, this.firstMessage];
}

class CreateMessageEvent extends QueriesEvent {
  final String newMessage;
  final String chatId;

  CreateMessageEvent({required this.newMessage, required this.chatId});

  @override
  List<Object> get props => [this.newMessage, this.chatId];
}

class LoginEvent extends QueriesEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [this.email, this.password];
}

class RegisterEvent extends QueriesEvent {
  final String email;
  final String password;
  final String name;

  RegisterEvent(
      {required this.email, required this.password, required this.name});

  @override
  List<Object> get props => [this.email, this.password, this.name];
}

class ChangeViewEvent extends QueriesEvent {
  @override
  List<Object> get props => [];
}
