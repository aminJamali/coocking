import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../../../infrastructures/utils/utils.dart';

class DurationPicker extends StatefulWidget {
  final String title;
  final int? duration;
  final void Function(int) onDurationChange;

  const DurationPicker({
    required final this.onDurationChange,
    required final this.title,
    final Key? key,
    final this.duration,
  }) : super(key: key);

  @override
  _DurationPickerState createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {

  int _minute = 0;
  int _hour = 0;
  int _selectedDuration = 0;
  final _itemWidth = 45.0;
  final _itemHeight = 35.0;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    if (widget.duration != null&& widget.duration!=0) {
      _minute = Utils.convertDurationToMinute(widget.duration!);
      _hour = Utils.convertDurationToHour(widget.duration!);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(widget.title),
        const Spacer(),
        NumberPicker(
          value: _minute,
          minValue: 0,
          maxValue: 59,
          itemCount: 2,
          zeroPad: true,
          itemWidth: _itemWidth,
          itemHeight: _itemHeight,
          textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 16.0),
          selectedTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 28.0),
          onChanged: _onMinuteChange,
        ),
        Text(
          ':',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 16.0),
        ),
        NumberPicker(
          value: _hour,
          minValue: 0,
          maxValue: 99,
          itemCount: 2,
          zeroPad: true,
          itemWidth: _itemWidth,
          itemHeight: _itemHeight,
          textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 16.0),
          selectedTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 28.0),
          onChanged: _onHourChange,
        ),
        const Spacer(),
      ]);
  }

  void _onMinuteChange(final int minute) {
    setState(() {
      _minute = minute;
    });
    _calculateDuration();
  }

  void _onHourChange(final int hour) {
    setState(() {
      _hour = hour;
    });
    _calculateDuration();
  }

  void _calculateDuration() {
    _selectedDuration = (_hour * 60) + _minute;
    widget.onDurationChange(_selectedDuration);
  }
}
