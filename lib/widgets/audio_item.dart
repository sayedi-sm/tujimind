import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tujimind/models/audio_model.dart';

// TODO: Delete AudioItem class
class AudioItem extends StatefulWidget {
  final AudioModel audioModel;
  final int index;
  final void Function(int) updatePlayer;

  AudioItem(this.audioModel, this.index, this.updatePlayer, {Key? key})
      : super(key: key);

  @override
  State<AudioItem> createState() => _AudioItemState();
}

class _AudioItemState extends State<AudioItem> {
  bool isPlaying = false;

  late final AudioPlayer audioPlayer = widget.audioModel.audioPlayer;

  Duration duration = Duration.zero; // For total duration
  Duration position = Duration.zero; // For the current position

  Future<void> setAudioPlayer() async {
    final player = AudioCache(prefix: "assets/audios/");
    final url = await player.load("song.mp3");
    audioPlayer.setSourceUrl(url.path);
    audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void initState() {
    super.initState();

    setAudioPlayer();

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
          print("Position is $position");
        });
      }
    });

    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          if (state == PlayerState.stopped) {
            position = Duration.zero;
          }
          isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F2FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: [
          Slider(
            value: position.inMilliseconds.toDouble(),
            max: duration.inMilliseconds.toDouble(),
            onChanged: (value) {
              setState(() {
                position = Duration(milliseconds: value.toInt());
              });
              audioPlayer.seek(position);
            },
          ),
          GestureDetector(
            onTap: () async {
              if (isPlaying) {
                await audioPlayer.pause();
              } else {
                widget.updatePlayer(widget.index);
                await audioPlayer.resume();
              }
            },
            child: CircleAvatar(
              child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            ),
          ),
        ],
      ),
    );
  }
}
