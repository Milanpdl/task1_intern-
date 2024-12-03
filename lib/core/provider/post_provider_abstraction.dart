import 'package:api_post/core/config/Model/model.dart';
import 'package:flutter/material.dart';

abstract class PostProviderAbstraction {
  Future<void> getPost();
  Future<void> addPost(ListModel list, BuildContext context);
}
