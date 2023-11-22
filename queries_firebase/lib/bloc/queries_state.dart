part of 'queries_bloc.dart';

sealed class QueriesState extends Equatable {
  const QueriesState();

  @override
  List<Object> get props => [];
}

final class QueriesInitial extends QueriesState {}

final class GetMessagesSuccesState extends QueriesState {}

final class ErrorState extends QueriesState {}

final class CreateChatSuccessState extends QueriesState {}

final class CreateMessageSuccessState extends QueriesState {}

final class LoginSuccessState extends QueriesState {}

final class LoadingState extends QueriesState {}

final class ChangeViewRegisterState extends QueriesState {}
