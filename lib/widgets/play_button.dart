import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  final Color color;
  final bool playingState;
  final VoidCallback onTap;

  const PlayButton({
    Key? key,
    required this.onTap,
    required this.playingState,
    required this.color,
  }) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> with TickerProviderStateMixin {
  late AnimationController _playButtonController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
  );

  @override
  Widget build(BuildContext context) {

    widget.playingState
        ? _playButtonController.forward()
        : _playButtonController.reverse();

    return GestureDetector(
      onTap: widget.onTap,
      child: CircleAvatar(
        backgroundColor: widget.color,
        radius: 20,
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            color: Colors.white,
            progress: _playButtonController,
            size: 28,
          ),
        ),
      ),
    );
  }
}
