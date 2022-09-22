import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:stream_duration/stream_duration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ExampleSlideCountdown(),
    );
  }
}

const defaultDuration = Duration(minutes: 20, seconds: 10);
const defaultPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 5);

class ExampleSlideCountdown extends StatefulWidget {
  const ExampleSlideCountdown({Key? key}) : super(key: key);

  @override
  State<ExampleSlideCountdown> createState() => _ExampleSlideCountdownState();
}

class _ExampleSlideCountdownState extends State<ExampleSlideCountdown> {
  Duration duration = Duration();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        duration = Duration(seconds: 5);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Example"),
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text('Default'),
            ),
            const SlideCountdown(
              duration: defaultDuration,
              padding: defaultPadding,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text('Default SlideCountdownSeparated'),
            ),
            const SlideCountdownSeparated(
              duration: defaultDuration,
              padding: defaultPadding,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text('With Icon, Fade true, & SlideDirection.up'),
            ),
            const SlideCountdown(
              duration: defaultDuration,
              padding: defaultPadding,
              slideDirection: SlideDirection.up,
              icon: Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.alarm,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text('Custom BoxDecoration & SeparatorType.title'),
            ),
            const SlideCountdown(
              duration: defaultDuration,
              padding: defaultPadding,
              separatorType: SeparatorType.title,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text('Localization Custom Duration Title'),
            ),
            SlideCountdown(
              duration: duration,
              padding: defaultPadding,
              separatorType: SeparatorType.title,
              durationTitle: DurationTitle.id(),
              icon: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.alarm,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text('With Column, & SlideDirection.up'),
            ),
            SlideCountdown(
              decoration: BoxDecoration(color: Colors.black45),
              textStyle: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              duration: duration,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              slideDirection: SlideDirection.up,
              subTextStyle: TextStyle(fontSize: 16, color: Colors.white),
              durationTitle: DurationTitle(
                  days: 'Days',
                  hours: 'Hours',
                  minutes: 'minutes',
                  seconds: 'seconds'),
              showZeroValue: true,
              separatorPadding: EdgeInsets.symmetric(horizontal: 22),
              isSubTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
