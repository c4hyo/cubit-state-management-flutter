part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoad extends PostState {
  final List<PostModel> model;
  PostLoad({this.model});
}

class PostFailed extends PostState {
  final String error;
  PostFailed({this.error});
}
