import 'package:flutter/material.dart';
import 'package:folder_architecture/core/constants/enums/http_request_enum.dart';
import 'package:folder_architecture/view/_product/_utility/service_helper.dart';
import 'package:folder_architecture/view/_product/enum/network_route_enum.dart';
import 'package:folder_architecture/view/home/social/model/query/friend_query.dart';
import 'package:folder_architecture/view/home/social/model/social_user_model.dart';
import 'package:folder_architecture/view/home/social/service/ISocialService.dart';
import 'package:vexana/vexana.dart';

class SocialService extends ISocialService with ServiceHelper {
  SocialService(INetworkManager networkManager) : super(manager: networkManager);

  @override
  Future<SocialUser?> fetchUser(dynamic id) {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query, BuildContext context) async {
    //ilkinde neyi parse edicem, ikincisinde neyi alicam
    final response = await manager.send<SocialUser, List<SocialUser>>(NetWorkRoutes.PHOTOS.rawValue,
        parseModel: SocialUser(), method: RequestType.GET);
    showMessage(response.error, context);
    return response.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}
