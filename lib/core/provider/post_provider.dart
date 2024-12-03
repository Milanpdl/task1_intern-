import 'dart:io';

import 'package:api_post/core/provider/post_provider_abstraction.dart';
import 'package:api_post/core/services/network_services.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../config/Model/model.dart';

final networkServiceProvider =
    Provider<NetworkServices>((ref) => NetworkServices());

final listProvider = FutureProvider<List<ListModel>>((ref) async {
  return ref.read(networkServiceProvider).fetchPost();
});

// final addPostProvider = FutureProvider.family<ListModel, Map<String, String>>(
//   (ref, arg) async {
//     return ref
//         .read(networkServiceProvider)
//         .addpost(arg['title']!, arg['body']!);
//   },
// );

final postProvider =
    StateNotifierProvider<PostProvider, AsyncValue<List<ListModel>>>(
        (ref) => PostProvider(ref));

class PostProvider extends StateNotifier<AsyncValue<List<ListModel>>>
    implements PostProviderAbstraction {
  PostProvider(this.ref) : super(const AsyncValue.loading()) {
    getPost();
  }
  final Ref ref;

  List<ListModel> tempList = [];

  Future<void> getPost() async {
    state = const AsyncValue.loading();
    try {
      final response = await ref.read(networkServiceProvider).fetchPost();
      tempList = response;
      state = AsyncValue.data(response);
    } on SocketException catch (e, st) {
      state = AsyncValue.error("No Interent Connection", st);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addPost(ListModel data, BuildContext context) async {
    state = const AsyncValue.loading();
    try {
      final response = await ref.read(networkServiceProvider).addpost(data);
      state = AsyncValue.data([response, ...tempList]);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
      state = AsyncValue.data([...tempList]);
    }
  }
}

final loadingProvider = StateProvider<bool>((ref) => false);
