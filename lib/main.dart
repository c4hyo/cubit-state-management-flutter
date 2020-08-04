import 'package:cubit_test/bloc/post/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
        home: ListPost(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ListPost extends StatefulWidget {
  @override
  _ListPostState createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  @override
  void initState() {
    context.bloc<PostCubit>().postIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit State Management"),
      ),
      body: Container(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoad) {
              return ListView.builder(
                itemCount: state.model.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("${state.model[index].title}"),
                      subtitle: Text("${state.model[index].body}"),
                      leading: Text("${state.model[index].id}"),
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text("${state.toString()}"),
            );
          },
        ),
      ),
    );
  }
}
