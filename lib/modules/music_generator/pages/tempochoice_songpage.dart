import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tempo/modules/music_generator/components/controls.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tempo/modules/music_generator/models/positionDataOfProgressBar.dart';
import 'package:tempo/utils/constants.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late AudioPlayer _audioPlayer;
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setAsset('assets/audio/audio.mp3');
    _audioPlayer.positionStream.listen((event) {
      print(event);
    });
    _audioPlayer.bufferedPositionStream.listen((event) {
      print(event);
    });
    _audioPlayer.durationStream.listen((event) {
      print(event);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: ListTile(
          title: Text(AppLocalizations.of(context)!
              .tempochoice_songpage_page_appbar_leading_title,
          ),
          subtitle:  IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.menu,color:black))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: appPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<PositionData>(stream: _positionDataStream, builder: (context, snapshot){
              final positionData= snapshot.data;
              return ProgressBar(
                barHeight: 8,
                bufferedBarColor: grey,
                baseBarColor: grey,
                progressBarColor: primaryColor,
                thumbColor: primaryColor,
                timeLabelTextStyle: const TextStyle(
                  color:black,
                  fontWeight: FontWeight.w600
                ),
                buffered: positionData?.bufferedPosition??Duration.zero,
                progress: positionData?.position??Duration.zero,
                total: positionData?.duration?? Duration.zero,
                onSeek: _audioPlayer.seek,
              );
            }),
            const SizedBox(height: 20,),
            Controls(
              audioPlayer: _audioPlayer,
            )
          ],
        ),
      ),
    );
  }
}
