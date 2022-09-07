import 'dart:math';

import 'package:flutter/material.dart';

/// The state of a [TujiStep] which is used to control the style of the circle and
/// text.
///
/// See also:
///
///  * [TujiStep]
enum TujiStepState {
  /// A step that displays an arbitrary icon in its circle.
  iconified,

  /// A step that displays a tick icon in its circle.
  complete,

  /// A step that is disabled and does not to react to taps.
  disabled,
}

const double _kStepSize = 24.0;

class StepStyle {
  final Color fillColor;
  final Color borderColor;
  final Color inactiveFillColor;
  final Color inactiveBorderColor;
  final TextStyle textStyle;
  final TextStyle inactiveTextStyle;

  const StepStyle({
    this.fillColor = const Color(0xFFECE9FF),
    this.borderColor = const Color(0xFF6F59F3),
    this.inactiveFillColor = Colors.transparent,
    this.inactiveBorderColor = const Color(0xFFE3E3E3),
    this.textStyle = const TextStyle(
      color: Color(0xFF6F59F3),
      fontSize: 12,
    ),
    this.inactiveTextStyle = const TextStyle(
      color: Color(0xFFE3E3E3),
      fontSize: 12,
    ),
  });
}

/// A material step used in [TujiStepper]. The step can have a child,
/// an icon within its circle, and a state that governs its
/// styling.
///
/// See also:
///
///  * [TujiStepper]
@immutable
class TujiStep {
  final String title;
  final String subtitle;

  /// The state of the step which determines the styling of its components
  /// and whether steps are interactive.
  final TujiStepState state;

  /// Whether or not the step is active. The flag only influences styling.
  final bool isActive;

  /// Creates a step for a [TujiStepper].
  ///
  /// The [title] argument must not be null.
  const TujiStep({
    required this.title,
    required this.subtitle,
    this.state = TujiStepState.disabled,
    this.isActive = false,
  });
}

/// A material stepper widget that displays progress through a sequence of
/// steps. Steppers are particularly useful in the case of forms where one step
/// requires the completion of another one, or where multiple steps need to be
/// completed in order to submit the whole form.
///
/// The widget is a flexible wrapper. A parent class should pass [currentStep]
/// to this widget based on some logic triggered by the three callbacks that it
/// provides.
///
/// See also:
///
///  * [TujiStep]
class TujiStepper extends StatefulWidget {
  /// The steps of the stepper whose children and icons always get shown.
  ///
  /// The length of [steps] must not change.
  final List<TujiStep> steps;

  /// How the stepper's scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to
  /// animate after the user stops dragging the scroll view.
  ///
  /// If the stepper is contained within another scrollable it
  /// can be helpful to set this property to [ClampingScrollPhysics].
  final ScrollPhysics? physics;

  /// The index into [steps] of the current step whose content is displayed.
  final int currentStep;

  /// Custom margin on stepper.
  final EdgeInsetsGeometry? margin;

  /// Custom style for step indicator
  final StepStyle stepStyle;

  /// The callback called when a step is tapped, with its index passed as
  /// an argument.
  final ValueChanged<int>? onStepTapped;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will be disabled.
  final VoidCallback? onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will be disabled.
  final VoidCallback? onStepCancel;

  /// Creates a stepper from a list of steps.
  ///
  /// This widget is not meant to be rebuilt with a different list of steps
  /// unless a key is provided in order to distinguish the old stepper from the
  /// new one.
  ///
  /// The [steps] and [currentStep] arguments must not be null.
  const TujiStepper({
    Key? key,
    required this.steps,
    this.physics,
    this.currentStep = 0,
    this.onStepTapped,
    this.margin,
    this.stepStyle = const StepStyle(),
    this.onStepContinue,
    this.onStepCancel,
  })  : assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  @override
  State<TujiStepper> createState() => _TujiStepperState();
}

class _TujiStepperState extends State<TujiStepper> {
  late List<GlobalKey> _keys;
  final Map<int, TujiStepState> _oldStates = <int, TujiStepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (index) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1) {
      _oldStates[i] = widget.steps[i].state;
    }
  }

  @override
  void didUpdateWidget(TujiStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1) {
      _oldStates[i] = oldWidget.steps[i].state;
    }
  }

  bool _isLast(index) {
    return widget.steps.length - 1 == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  Widget _buildCircleChild(int index) {
    final TujiStepState state = widget.steps[index].state;
    switch (state) {
      case TujiStepState.iconified:
        return Icon(
          Icons.lens,
          size: 18,
          color: widget.stepStyle.borderColor,
        );
      case TujiStepState.complete:
        return Icon(
          Icons.check,
          size: 18,
          color: widget.stepStyle.borderColor,
        );
      case TujiStepState.disabled:
        return const SizedBox.shrink();
    }
  }

  Color _fillColor(int index) {
    return widget.steps[index].isActive
        ? widget.stepStyle.fillColor
        : widget.stepStyle.inactiveFillColor;
  }

  Color _borderColor(int index) {
    return widget.steps[index].isActive
        ? widget.stepStyle.borderColor
        : widget.stepStyle.inactiveBorderColor;
  }

  Widget _buildCircle(int index) {
    return Container(
      decoration: BoxDecoration(
        color: _fillColor(index),
        shape: BoxShape.circle,
        border: Border.all(color: _borderColor(index)),
      ),
      width: _kStepSize,
      height: _kStepSize,
      alignment: Alignment.center,
      child: _buildCircleChild(index),
    );
  }

  Widget _buildLine(int index) {
    return Container(
      width: 1,
      color: _borderColor(index),
    );
  }

  Widget _buildStepStructure(int index) {
    return Column(
      children: [
        _buildCircle(index),
        if (!_isLast(index)) Expanded(child: _buildLine(index)),
      ],
    );
  }

  Widget _buildControls(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (index > 0)
          GestureDetector(
            onTap: widget.onStepCancel,
            child: Transform.rotate(
              angle: pi / 2,
              child: Icon(
                Icons.arrow_back_ios_sharp,
                size: 20,
              ),
            ),
          ),
        if (0 < index && index < widget.steps.length - 1)
          const SizedBox(width: 16),
        if (index < widget.steps.length - 1)
          GestureDetector(
            onTap: widget.onStepContinue,
            child: Transform.rotate(
              angle: -pi / 2,
              child: Icon(
                Icons.arrow_back_ios_sharp,
                size: 20,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildChild(int index) {
    return GestureDetector(
      onTap: (widget.steps[index].state != TujiStepState.disabled)
          ? () {
              // In the vertical case we need to scroll to the newly tapped
              // step.
              Scrollable.ensureVisible(
                _keys[index].currentContext!,
                curve: Curves.fastOutSlowIn,
                duration: kThemeAnimationDuration,
              );

              widget.onStepTapped!.call(index);
            }
          : null,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: _kStepSize + 16, bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: _fillColor(index),
          border: Border.all(color: widget.stepStyle.inactiveBorderColor),
          // border: Border.all(color: _borderColor(index)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${index + 1}) ${widget.steps[index].title}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              "${widget.steps[index].subtitle}",
              style: TextStyle(fontSize: 12),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            if (_isCurrent(index)) const SizedBox(height: 8),
            if (_isCurrent(index)) _buildControls(index),
          ],
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return ListView(
      shrinkWrap: true,
      physics: widget.physics,
      // padding: const EdgeInsets.all(16),
      children: [
        for (int i = 0; i < widget.steps.length; i++)
          Stack(
            key: _keys[i],
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                child: _buildStepStructure(i),
              ),
              _buildChild(i),
            ],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildStepper();
  }
}
