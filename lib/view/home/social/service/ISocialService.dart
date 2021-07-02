import 'package:flutter/material.dart';
import 'package:folder_architecture/view/_product/_models/query/user_query.dart';
import 'package:folder_architecture/view/home/social/model/social_user_model.dart';
import 'package:vexana/vexana.dart';

abstract class ISocialService {
  final INetworkManager manager;

  ISocialService({
    required this.manager,
  });

  Future<List<SocialUser>> fetchUserHouseList(UserQuery query, BuildContext context);
  Future<List<SocialUser>> fetchUserNameQuery(String text);
  Future<SocialUser?> fetchUser(dynamic id, BuildContext context);
}
