import 'package:api_post/core/utils/text_size.dart';
import 'package:api_post/features/Home_screen/widget/card_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/provider/post_provider.dart';
import '../Add_Item/add_item.dart';

class MyPost extends ConsumerWidget {
  const MyPost({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postlist = ref.watch(postProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "List Item",
              style: TextStyle(
                  fontSize: TextSize.titlefont, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddItem()));
          },
          label: Text("Add List"),
          icon: Icon(Icons.add),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          tooltip: 'Add Item',
          elevation: 6,
        ),
        body: postlist.when(
            data: (posts) {
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return CardWidget(
                      listitem: post,
                    );
                  });
            },
            error: (error, stack) => Center(
                  child: Text('Error $error'),
                ),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
