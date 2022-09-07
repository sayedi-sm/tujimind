import 'package:audioplayers/audioplayers.dart';

class AudioCard {
  final String title;
  final String subtitle;
  final String duration;
  final String audioUrl;
  final AudioPlayer audioPlayer;

  AudioCard({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.audioUrl,
    required this.audioPlayer,
  });
}
