import 'package:flutter/material.dart';
import 'package:folder_architecture/core/extensions/future_extension.dart';
import 'package:vexana/vexana.dart';

import 'package:folder_architecture/core/init/network/vexana_manager.dart';
import 'package:folder_architecture/view/home/game/model/game_model.dart';
import 'package:folder_architecture/view/home/game/service/IGameService.dart';
import 'package:folder_architecture/view/home/game/service/game_service.dart';

class GameViewDetails extends StatelessWidget {
  final GameModel gameModel;
  final INetworkManager manager = VexanaManager.instance!.networkManager;
  IGameService get gameService => GameService(manager);
  GameViewDetails({
    Key? key,
    required this.gameModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: gameService.fetchSelectedGame(gameModel.id, context).toBuild<GameModel?>(
          onSuccess: (data) {
            return Center(
              child: Image.network(data!.url!),
            );
          },
          loadingWidget: const Center(
            child: CircularProgressIndicator(),
          ),
          notFoundWidget: const Center(child: Text('Not Found')),
          onError: const Center(child: Text('Not Found'))),
    );
  }
}
