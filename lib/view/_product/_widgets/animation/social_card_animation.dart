import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:folder_architecture/view/home/social/view/social_view_detail.dart';

import '../../../home/social/model/social_user_model.dart';

class OpenContainerSocailWrapper extends StatelessWidget {
  ContainerTransitionType get _transitionType => ContainerTransitionType.fade;

  final OpenContainerBuilder? closedBuilder;
  final ClosedCallback<bool?>? onClosed;
  final SocialUser? socialUser;
  const OpenContainerSocailWrapper({
    Key? key,
    this.closedBuilder,
    this.onClosed,
    this.socialUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: _transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return SocialUserViewDetail(socialUser: socialUser!);
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder! as Widget Function(BuildContext, void Function()),
    );
  }
}
