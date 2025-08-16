import 'package:flutter/material.dart';

class GrowingTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? textStyle;
  final double minWidth;
  final double maxWidth;

  const GrowingTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.textStyle,
    this.minWidth = 160,
    this.maxWidth = double.infinity,
  });

  @override
  State<GrowingTextField> createState() => _GrowingTextFieldState();
}

class _GrowingTextFieldState extends State<GrowingTextField> {
  double _width = 110;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateWidth);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateWidth());
  }

  void _updateWidth() {
    final text = widget.controller.text.isEmpty ? widget.hintText : widget.controller.text;
    final style = widget.textStyle ?? DefaultTextStyle.of(context).style;

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final newWidth = textPainter.width + 24; // Add padding
    final screenWidth = MediaQuery.of(context).size.width;

    setState(() {
      _width = newWidth.clamp(
        widget.minWidth,
        widget.maxWidth == double.infinity ? screenWidth : widget.maxWidth,
      );
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateWidth);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: _width,
            child: TextField(
              textAlign: TextAlign.center,
              controller: widget.controller,
              style: widget.textStyle,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: const UnderlineInputBorder(),
                enabledBorder: const UnderlineInputBorder(),
                focusedBorder: const UnderlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

