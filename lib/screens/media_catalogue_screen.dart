import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/models/audio_card.dart';
import 'package:tujimind/widgets/audio_card_item.dart';
import 'package:tujimind/widgets/search_field.dart';
import 'package:tujimind/widgets/tuji_choice_chip.dart';

class MediaCatalogueScreen extends StatefulWidget {
  static const String id = "MediaCatalogueScreen";

  const MediaCatalogueScreen({Key? key}) : super(key: key);

  @override
  State<MediaCatalogueScreen> createState() => _MediaCatalogueScreenState();
}

class _MediaCatalogueScreenState extends State<MediaCatalogueScreen> {
  final List<AudioCard> _audioCards = [
    AudioCard(
      title: "Relaxation Meditation",
      subtitle: "Apple and bananas and oranges and avocados",
      duration: "2 Sessions / 20 min",
      audioUrl: "song.mp3",
      audioPlayer: AudioPlayer(),
    ),
    AudioCard(
      title: "Anti Stress Meditation",
      subtitle: "Apple and bananas and oranges and avocados",
      duration: "4 Sessions / 10 min",
      audioUrl: "sound.mp3",
      audioPlayer: AudioPlayer(),
    ),
    AudioCard(
      title: "Good Night",
      subtitle: "Apple and bananas and oranges and avocados",
      duration: "2 Sessions / 8 min",
      audioUrl: "song.mp3",
      audioPlayer: AudioPlayer(),
    ),
    AudioCard(
      title: "Stay Focus",
      subtitle: "Apple and bananas and oranges and avocados",
      duration: "6 Sessions / 13 min",
      audioUrl: "sound.mp3",
      audioPlayer: AudioPlayer(),
    ),
    AudioCard(
      title: "Relaxation Meditation",
      subtitle: "Apple and bananas and oranges and avocados",
      duration: "2 Sessions / 20 min",
      audioUrl: "song.mp3",
      audioPlayer: AudioPlayer(),
    ),
    AudioCard(
      title: "Anti Stress Meditation",
      subtitle: "Apple and bananas and oranges and avocados",
      duration: "4 Sessions / 10 min",
      audioUrl: "sound.mp3",
      audioPlayer: AudioPlayer(),
    ),
    AudioCard(
      title: "Good Night",
      subtitle: "Apple and bananas and oranges and avocados",
      duration: "2 Sessions / 8 min",
      audioUrl: "song.mp3",
      audioPlayer: AudioPlayer(),
    ),
    AudioCard(
      title: "Stay Focus",
      subtitle: "Apple and bananas and oranges and avocados",
      duration: "6 Sessions / 13 min",
      audioUrl: "sound.mp3",
      audioPlayer: AudioPlayer(),
    ),
  ];

  List<String> _choiceLabels = [
    "All",
    "Audio",
    "Video",
  ];

  List<bool> _choiceStates = [false, true, false];

  final Color pagePrimaryColor = tujiRedColor;

  int? _playingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTujiAppBar("Media Catalogue"),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SearchField(
              hintText: "Search audio & videos",
              color: pagePrimaryColor,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _choiceLabels.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TujiChoiceChip(
                    label: _choiceLabels[index],
                    selected: _choiceStates[index],
                    color: pagePrimaryColor,
                    onSelected: (value) {
                      setState(() {
                        _choiceStates[index] = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: _audioCards.length,
              itemBuilder: (ctx, index) => AudioCardItem(
                audioCard: _audioCards[index],
                color: pagePrimaryColor,
                index: index,
                updatePlayingIndex: updatePlayingIndex,
              ),
              separatorBuilder: (ctx, index) => SizedBox(height: 8),
            ),
          ),
        ],
      ),
    );
  }

  void updatePlayingIndex(int index) {
    if (_playingIndex != null && index != _playingIndex) {
      _audioCards[_playingIndex!].audioPlayer.stop();
    }
    _playingIndex = index;
  }
}
