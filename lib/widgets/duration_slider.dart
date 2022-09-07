import 'package:flutter/material.dart';

class DurationSlider extends StatelessWidget {
  final Duration positionDuration;
  final Duration totalDuration;
  final Color activeColor;
  final Color inactiveColor;
  final void Function(double)? onChanged;

  const DurationSlider({
    Key? key,
    required this.positionDuration,
    required this.totalDuration,
    required this.activeColor,
    required this.inactiveColor,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _formatTime(positionDuration),
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
              overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
            ),
            child: Slider(
              value: positionDuration.inMilliseconds.toDouble(),
              max: totalDuration.inMilliseconds.toDouble(),
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              onChanged: onChanged,
            ),
          ),
        ),
        Text(
          _formatTime(totalDuration),
          style: TextStyle(fontSize: 11),
        ),
      ],
    );
  }

  String _formatTime(Duration time) {
    int timeInSecs = time.inSeconds;
    int secs = timeInSecs % 60;
    int mins = timeInSecs ~/ 60;
    return "${mins < 10 ? "0$mins" : mins}:${secs < 10 ? "0$secs" : secs}";
  }
}
