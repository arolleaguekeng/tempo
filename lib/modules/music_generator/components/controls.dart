import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tempo/utils/constants.dart';

class Controls extends StatelessWidget {
  const Controls({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: audioPlayer.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;
          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 64.0,
              height: 64.0,
              child: CircularProgressIndicator(),
            );
          } else if (playing != true) {
            return IconButton(
              icon: const Icon(Icons.play_arrow_rounded),
              iconSize: 64.0,
              onPressed: audioPlayer.play,
            );
          } else if (processingState != ProcessingState.completed) {
            return IconButton(
              icon: const Icon(Icons.pause_rounded),
              iconSize: 64.0,
              color: black,
              onPressed: audioPlayer.pause,
            );
          } else {
            return IconButton(
              icon: Icon(Icons.replay),
              iconSize: 64.0,
              onPressed: () => audioPlayer.seek(Duration.zero, index: 0),
            );
          }
        });
  }
}
