part of 'default.dart';

class MinutesDigit extends BaseDigits {
  const MinutesDigit({
    Key? key,
    required Duration duration,
    required ValueNotifier<int> firstDigit,
    required ValueNotifier<int> secondDigit,
    required TextStyle textStyle,
    required int initValue,
    required SlideDirection slideDirection,
    required bool showZeroValue,
    required Curve curve,
    required bool countUp,
    required Duration slideAnimationDuration,
    required SeparatorType separatorType,
    required DurationTitle durationTitle,
    EdgeInsets? separatorPadding,
    String? separator,
    TextDirection? textDirection,
  }) : super(
          key: key,
          duration: duration,
          firstDigit: firstDigit,
          secondDigit: secondDigit,
          textStyle: textStyle,
          initValue: initValue,
          slideDirection: slideDirection,
          showZeroValue: showZeroValue,
          curve: curve,
          countUp: countUp,
          slideAnimationDuration: slideAnimationDuration,
          separatorType: separatorType,
          durationTitle: durationTitle,
          separatorPadding: separatorPadding,
          separator: separator,
          textDirection: textDirection,
        );

  @override
  State<MinutesDigit> createState() => _MinutesDigitState();
}

class _MinutesDigitState extends State<MinutesDigit> {
  @override
  Widget build(BuildContext context) {
    final duration = widget.duration;
    if (duration.inMinutes < 1 && !widget.showZeroValue) {
      return const SizedBox.shrink();
    }
    final firstDigit = TextAnimation(
      slideAnimationDuration: widget.slideAnimationDuration,
      value: widget.firstDigit,
      textStyle: widget.textStyle,
      slideDirection: widget.slideDirection,
      curve: widget.curve,
      countUp: widget.countUp,
      showZeroValue: widget.showZeroValue,
    );

    final secondDigit = TextAnimation(
      slideAnimationDuration: widget.slideAnimationDuration,
      value: widget.secondDigit,
      textStyle: widget.textStyle,
      slideDirection: widget.slideDirection,
      curve: widget.curve,
      countUp: widget.countUp,
      showZeroValue: widget.showZeroValue,
    );

    final separator = Padding(
      padding: widget.separatorPadding ?? EdgeInsets.zero,
      child: Visibility(
        visible: widget.separatorType == SeparatorType.symbol,
        child: Text(widget.separator ?? ':', style: widget.textStyle),
        replacement:
            Text(widget.durationTitle.minutes, style: widget.textStyle),
      ),
    );

    List<Widget> children = widget.textDirection != null &&
            widget.textDirection == TextDirection.rtl
        ? [
            separator,
            secondDigit,
            firstDigit,
          ]
        : [
            firstDigit,
            secondDigit,
            separator,
          ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
