import 'package:bloc/bloc.dart';
import 'package:cubit_test/network/model/post.dart';
import 'package:meta/meta.dart';
import 'package:cubit_test/network/repository/post.dart';

part 'post_state.dart';

PostRepository _r = new PostRepository();

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  void postIndex() async {
    try {
      List<PostModel> list = await _r.index();
      emit(PostLoad(model: list));
    } catch (e) {
      emit(PostFailed(error: e.toString()));
    }
  }
}
