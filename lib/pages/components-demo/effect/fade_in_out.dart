import 'package:flutter/material.dart';

const img1 =
    'https://images.unsplash.com/photo-1675789652969-ffa422802499?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80';
const img2 =
    'https://images.unsplash.com/photo-1675864545870-5588fd072dc7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80';

class FadeInOutImage extends StatefulWidget {
  const FadeInOutImage({super.key});

  @override
  State<FadeInOutImage> createState() => _FadeInOutImageState();
}

class _FadeInOutImageState extends State<FadeInOutImage> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('淡入淡出切换图片')),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() {
            _showFirst = _showFirst ? false : true;
          }),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 1.0)),
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 2),
              firstChild: Image.network(img1),
              secondChild: Image.network(img2),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstCurve: const Interval(0.0, 0.5),
              secondCurve: const Interval(0.5, 1.0),
            ),
            // child: AnimatedSwitcher(
            //   duration: const Duration(seconds: 2),
            //   child: Image.network(
            //     _imgPath,
            //     key: ValueKey(_imgPath),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
