import 'package:api_post/core/config/Model/model.dart';
import 'package:api_post/core/provider/post_provider.dart';
import 'package:api_post/core/utils/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Add Item",
              style: TextStyle(
                fontSize: TextSize.heading1,
              ),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "List Title",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter  List Title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: bodyController,
                  decoration: InputDecoration(
                    labelText: "List body",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter  List Body';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Consumer(builder: (context, ref, _) {
                  return ElevatedButton(
                      onPressed: () async {
                        final newPost = ListModel(
                            id: 0,
                            title: titleController.text.trim(),
                            body: bodyController.text.trim());
                        await ref
                            .read(postProvider.notifier)
                            .addPost(newPost, context);
                        Navigator.pop(context);
                      },
                      child: Text("Add"));
                })
              ],
            )),
          ),
        ));
  }
}

// class _AddItemState extends State<AddItem> {
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _formkey = GlobalKey<FormState>();
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }

  // @override
  // Widget build(BuildContext context, ) {
    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Center(
    //         child: Text(
    //           "Add Item",
    //           style: TextStyle(
    //             fontSize: TextSize.heading1,
    //           ),
    //         ),
    //       ),
    //     ),
    //     body: Center(
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Form(
    //             key: _formkey,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 TextFormField(
    //                   controller: _titleController,
    //                   decoration: InputDecoration(
    //                     labelText: "List Title",
    //                   ),
    //                   validator: (value) {
    //                     if (value == null || value.isEmpty) {
    //                       return 'please enter  List Title';
    //                     }
    //                     return null;
    //                   },
    //                 ),
    //                 TextFormField(
    //                   controller: _descriptionController,
    //                   decoration: InputDecoration(
    //                     labelText: "List body",
    //                   ),
    //                   validator: (value) {
    //                     if (value == null || value.isEmpty) {
    //                       return 'please enter  List Body';
    //                     }
    //                     return null;
    //                   },
    //                 ),
    //                 SizedBox(
    //                   height: 15,
    //                 ),
    //                 ElevatedButton(
    //                     onPressed: () {
    //                       final title = _titleController.text;
    //                       final body = _descriptionController.text;

    //                       if (title.isNotEmpty && body.isNotEmpty) {
    //                         context
    //                             .read(addPostProvider(
    //                                 {'title': title, 'body': body}).future)
    //                             .then((newPost) {
    //                           ScaffoldMessenger.of(context).showSnackBar(
    //                               SnackBar(
    //                                   content: Text('Post add Successful!')));
    //                           Navigator.pop(context);
    //                         }).catchError((error) {
    //                           ScaffoldMessenger.of(context).showSnackBar(
    //                               SnackBar(
    //                                   content:
    //                                       Text("Fail to add list:$error")));
    //                         });
    //                       } else {
    //                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //                             content: Text("Please Fill the form")));
    //                       }
    //                     },
    //                     child: Text("Add"))
    //               ],
    //             )),
    //       ),
    //     ));
  

