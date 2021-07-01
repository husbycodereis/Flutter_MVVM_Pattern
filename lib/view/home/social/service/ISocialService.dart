import 'package:flutter/material.dart';
import 'package:folder_architecture/view/home/social/model/query/friend_query.dart';
import 'package:folder_architecture/view/home/social/model/social_user_model.dart';
import 'package:vexana/vexana.dart';

abstract class ISocialService {
  final INetworkManager manager;

  ISocialService({
    required this.manager,
  });

  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query, BuildContext context);
  Future<List<SocialUser>> fetchUserNameQuery(String text);
  Future<SocialUser?> fetchUser(dynamic id);
}
