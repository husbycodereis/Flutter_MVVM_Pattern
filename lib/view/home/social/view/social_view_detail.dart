import 'package:flutter/material.dart';
import 'package:folder_architecture/core/extensions/future_extension.dart';
import 'package:vexana/vexana.dart';

import 'package:folder_architecture/core/init/network/vexana_manager.dart';
import 'package:folder_architecture/view/home/social/model/social_user_model.dart';
import 'package:folder_architecture/view/home/social/service/ISocialService.dart';
import 'package:folder_architecture/view/home/social/service/social_service.dart';

class SocialUserViewDetail extends StatelessWidget {
  final SocialUser socialUser;
  final INetworkManager manager = VexanaManager.instance!.networkManager;
  ISocialService get socialService => SocialService(manager);
  SocialUserViewDetail({
    Key? key,
    required this.socialUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: socialService.fetchUser(socialUser.id, context).toBuild<SocialUser?>(
          onSuccess: (data) {
            return Center(child: Image.network(data!.url!));
          },
          loadingWidget: const Center(child: CircularProgressIndicator()),
          notFoundWidget: const Center(
            child: Text('Not Found'),
          ),
          onError: const Text('error yedin')),
    );
  }
}
