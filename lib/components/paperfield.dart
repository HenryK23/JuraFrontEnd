import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noteapp/utils/constants.dart';

// This is not my code I used a previous piece of code I used for this which is someone elses I believe. But this just makes the nice paper affect on the note!

double _kFontSize = 32.0;
double _kHeight = 1.5;
double _kLineHeight = _kFontSize * _kHeight;
double _kInitialHeight = _kLineHeight * 7;
late TextEditingController controller;

class PaperField extends StatefulWidget {
  final String initialText;

  const PaperField({required this.initialText});

  @override
  State<StatefulWidget> createState() {
    return _PaperFieldState();
  }
}

class _PaperFieldState extends State<PaperField> {
  late GlobalKey _textFieldKey;

  double lastKnownHeight = _kInitialHeight;

  @override
  initState() {
    super.initState();
    _textFieldKey = GlobalKey();
    controller = TextEditingController();
    controller.text = widget.initialText;
    WidgetsBinding.instance!.addPostFrameCallback((_) => _setLastKnownHeight());
  }

  void _setLastKnownHeight() {
    if (lastKnownHeight != 75) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        setState(() {
          lastKnownHeight = 75;
        });
      });
    }
  }

  Widget _buildLines() {
    int nLines = max(_kInitialHeight, lastKnownHeight) ~/ _kLineHeight;
    return Column(
        children: List.generate(
            nLines,
            (index) => Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: primaryBlack))),
                  height: _kLineHeight,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          Stack(children: [
            _buildLines(),
            ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: _kInitialHeight,
                ),
                child: NotificationListener<SizeChangedLayoutNotification>(
                  onNotification: (SizeChangedLayoutNotification notification) {
                    _setLastKnownHeight();
                    return true;
                  },
                  child: SizeChangedLayoutNotifier(
                    child: TextField(
                      key: _textFieldKey,
                      controller: controller,
                      cursorHeight: _kLineHeight * 0.6,
                      cursorWidth: 4,
                      maxLines: 7,
                      decoration: _inputDecoration(),
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                          fontSize: _kFontSize,
                          height: _kHeight,
                          color: Colors.grey[600]),
                    ),
                  ),
                )),
          ]),
        ]));
  }

  InputDecoration _inputDecoration() {
    return const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none);
  }
}
