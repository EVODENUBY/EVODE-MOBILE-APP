import 'package:flutter/material.dart';
import 'dart:async';

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration speed;
  final VoidCallback? onFinished;
  final bool loop;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.speed = const Duration(milliseconds: 50),
    this.onFinished,
    this.loop = false,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayedText = '';
  Timer? _timer;
  int _currentIndex = 0;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(widget.speed, (timer) {
      if (!_isDeleting) {
        if (_currentIndex < widget.text.length) {
          setState(() {
            _displayedText = widget.text.substring(0, _currentIndex + 1);
            _currentIndex++;
          });
        } else {
          if (widget.onFinished != null) {
            widget.onFinished!();
          }
          if (widget.loop) {
            _isDeleting = true;
          } else {
            _timer?.cancel();
          }
        }
      } else {
        if (_displayedText.isNotEmpty) {
          setState(() {
            _displayedText = _displayedText.substring(
                0, _displayedText.length - 1);
          });
        } else {
          _isDeleting = false;
          _currentIndex = 0;
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: _displayedText,
            style: widget.style,
          ),
          if (_currentIndex < widget.text.length)
            TextSpan(
              text: '|',
              style: widget.style?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}