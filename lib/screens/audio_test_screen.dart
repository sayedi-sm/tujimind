import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tujimind/widgets/audio_item.dart';

import '../models/audio_model.dart';

// TODO: Delete AudioTestScreen class
class AudioTestScreen extends StatefulWidget {
  AudioTestScreen({Key? key}) : super(key: key);

  @override
  State<AudioTestScreen> createState() => _AudioTestScreenState();
}

class _AudioTestScreenState extends State<AudioTestScreen> {
  List<AudioModel> _items = [
    AudioModel("url", AudioPlayer()),
    AudioModel("url", AudioPlayer()),
    AudioModel("url", AudioPlayer()),
    AudioModel("url", AudioPlayer()),
    AudioModel("url", AudioPlayer()),
    AudioModel("url", AudioPlayer()),
    AudioModel("url", AudioPlayer()),
  ];

  int? playingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Songs")),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (ctx, index) =>
            AudioItem(_items[index], index, updatePlayer),
      ),
    );
  }

  void updatePlayer(int index) {
    if (playingIndex != null && playingIndex != index) {
      _items[playingIndex!].audioPlayer.stop();
    }
    playingIndex = index;
  }
}
