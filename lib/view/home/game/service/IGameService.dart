import 'package:flutter/material.dart';
import 'package:folder_architecture/view/home/game/model/game_model.dart';
import 'package:vexana/vexana.dart';

abstract class IGameService {
  final INetworkManager manager;

  IGameService({
    required this.manager,
  });

  Future<List<GameModel>> fetchGames(BuildContext context);
  Future<GameModel?> fetchSelectedGame(dynamic id, BuildContext context);
}
