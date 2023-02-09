import 'package:flutter/material.dart';

class AnimatedMyButton extends StatefulWidget {
  const AnimatedMyButton({super.key});

  @override
  State<AnimatedMyButton> createState() => _AnimatedMyButtonState();
}

class _AnimatedMyButtonState extends State<AnimatedMyButton> {
  bool _isBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('可变宽度按钮')),
      body: Center(
        child: AnimatedContainer(
          width: _isBig ? 240 : 60,
          height: 60,
          duration: const Duration(milliseconds: 500),
          child: ElevatedButton(
            onPressed: () => setState(() => _isBig = !_isBig),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.purple,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _isBig
                  ? const Text('Ready !', style: TextStyle(color: Colors.white))
                  : const Icon(Icons.arrow_right_alt, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
