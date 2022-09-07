import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/models/audio_card.dart';
import 'package:provider/provider.dart';
import 'package:tujimind/widgets/duration_slider.dart';
import 'package:tujimind/widgets/play_button.dart';

import '../constants.dart';

class AudioCardItem extends StatefulWidget {
  final AudioCard audioCard;
  final Color color;
  final int index;
  final void Function(int) updatePlayingIndex;

  const AudioCardItem({
    Key? key,
    required this.audioCard,
    required this.color,
    required this.index,
    required this.updatePlayingIndex,
  }) : super(key: key);

  @override
  State<AudioCardItem> createState() => _AudioCardItemState();
}

class _AudioCardItemState extends State<AudioCardItem> {
  late final audioPlayer = widget.audioCard.audioPlayer;
  bool isPlaying = false;
  bool isCompleted = true;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // audioPlayer.setReleaseMode(ReleaseMode.stop);
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
        });
      }
    });

    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
          if (isPlaying) {
            isCompleted = false;
          }

          if (state == PlayerState.stopped) {
            position = Duration.zero;
            isCompleted = true;
          }
        });
      }
    });

    audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          audioPlayer.state = PlayerState.completed;
          isCompleted = true;
          position = Duration.zero;
        });
      }
    });
  }

  Future<void> setAudioPlayer() async {
    final player = AudioCache(prefix: "assets/audios/");
    final url = await player.load(widget.audioCard.audioUrl);
    audioPlayer.setSourceUrl(url.path);
    audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 28, right: 8),
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: cardFillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: cardBorderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.audioCard.title,
                style: TextStyle(fontSize: 18, letterSpacing: 1),
              ),
              SizedBox(height: 8),
              Text(
                widget.audioCard.subtitle,
                style: TextStyle(color: tujiDarkGreyColor),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.clock,
                    size: 16,
                    color: tujiDarkGreyColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.audioCard.duration,
                    style: TextStyle(color: tujiDarkGreyColor),
                  ),
                ],
              ),
              if (isPlaying || !isCompleted)
                DurationSlider(
                  positionDuration: position,
                  totalDuration: duration,
                  activeColor: widget.color,
                  inactiveColor: cardBorderColor,
                  onChanged: (value) {
                    setState(() {
                      position = Duration(milliseconds: value.toInt());
                    });
                    audioPlayer.seek(position);
                  },
                ),
            ],
          ),
        ),
        PlayButton(
          color: widget.color,
          playingState: isPlaying,
          onTap: () async {
            if (isPlaying) {
              await audioPlayer.pause();
            } else {
              widget.updatePlayingIndex(widget.index);
              // await audioPlayer.play(UrlSource("https://file-examples.com/storage/fe8bd9dfd063066d39cfd5a/2017/11/file_example_MP3_5MG.mp3"));
              await audioPlayer.resume();
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}

/*
Row(
                children: [
                  Text(
                    formatTime(position),
                    style: TextStyle(fontSize: 11),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 2,
                        trackShape: RectangularSliderTrackShape(),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 5,
                          elevation: 0,
                          pressedElevation: 0,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 15),
                      ),
                      child: Slider(
                        value: position.inMilliseconds.toDouble(),
                        max: duration.inMilliseconds.toDouble(),
                        activeColor: widget.color,
                        inactiveColor: cardBorderColor,
                        onChanged: (value) {
                          setState(() {
                            position = Duration(milliseconds: value.toInt());
                          });
                          audioPlayer.seek(position);
                        },
                      ),
                    ),
                  ),
                  Text(
                    formatTime(duration),
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
 */
