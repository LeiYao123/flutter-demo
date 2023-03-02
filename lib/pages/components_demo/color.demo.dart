import 'package:flutter/material.dart';
import 'package:tablet/style/color.dart';

class ColorDemoPage extends StatelessWidget {
  ColorDemoPage({super.key});

  final List<Map> _colorDarkList = [
    {
      'text': 'Text / Heavy <Dark>',
      'colorDesc': 'E9E9E9',
      'color': RColor.dark_text_heavy,
      'fcolor': Colors.black,
    },
    {
      'text': 'Text / Medium <Dark>',
      'colorDesc': 'A9A9A9',
      'color': RColor.dark_text_medium,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Lite <Dark>',
      'colorDesc': '888888',
      'color': RColor.dark_text_lite,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Reverse <Dark>',
      'colorDesc': '000000',
      'color': RColor.dark_text_reverse,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Absolute <Dark>',
      'colorDesc': '000000',
      'color': RColor.dark_bg_absolute,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Primary <Dark>',
      'colorDesc': '161616',
      'color': RColor.dark_bg_primary,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Primary Elevated <Dark>',
      'colorDesc': '202020',
      'color': RColor.dark_bg_primary_elevated,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Secondary <Dark>',
      'colorDesc': '282828',
      'color': RColor.dark_bg_secondary,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Tertiary <Dark>',
      'colorDesc': '363636',
      'color': RColor.dark_bg_tertiary,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Reverse <Dark>',
      'colorDesc': 'FFFFFF',
      'color': RColor.dark_bg_reverse,
      'fcolor': Colors.black,
    },
    {
      'text': 'Common / 120 Absolute <Dark>',
      'colorDesc': 'FFFFFF',
      'color': RColor.dark_common_120,
      'fcolor': Colors.black,
    },
    {
      'text': 'Common / 100 Primary <Dark>',
      'colorDesc': 'E9E9E9',
      'color': RColor.dark_common_100,
      'fcolor': Colors.black,
    },
    {
      'text': 'Common / 64 Secondary <Dark>',
      'colorDesc': 'A9A9A9',
      'color': RColor.dark_common_64,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 32 Label <Dark>',
      'colorDesc': '888888',
      'color': RColor.dark_common_32,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 16 Disable <Dark>',
      'colorDesc': '555555',
      'color': RColor.dark_common_16,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 8 Line <Dark>',
      'colorDesc': '404040',
      'color': RColor.dark_common_8,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 4 Line <Dark>',
      'colorDesc': '323232',
      'color': RColor.dark_common_4,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 2 Line <Dark>',
      'colorDesc': '242424',
      'color': RColor.dark_common_2,
      'fcolor': Colors.white,
    },
  ];

  final List<Map> _colorLightList = [
    {
      'text': 'Text / Heavy <Light>',
      'colorDesc': '121314',
      'color': RColor.light_text_heavy,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Medium <Light>',
      'colorDesc': '5D6872',
      'color': RColor.light_text_medium,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Lite <Light>',
      'colorDesc': 'B0B8BE',
      'color': RColor.light_text_lite,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Reverse <Light>',
      'colorDesc': 'FFFFFF',
      'color': RColor.light_text_reverse
    },
    {
      'text': 'BG / Absolute <Light>',
      'colorDesc': 'FFFFFF',
      'color': RColor.light_bg_absolute
    },
    {
      'text': 'BG / Primary <Light>',
      'colorDesc': 'FFFFFF',
      'color': RColor.light_bg_primary
    },
    {
      'text': 'BG / Primary Elevated <Light>',
      'colorDesc': 'FFFFFF',
      'color': RColor.light_bg_primary_elevated
    },
    {
      'text': 'BG / Secondary <Light>',
      'colorDesc': 'FAFBFC',
      'color': RColor.light_bg_secondary
    },
    {
      'text': 'BG / Tertiary <Light>',
      'colorDesc': 'FAFAFA',
      'color': RColor.light_bg_tertiary
    },
    {
      'text': 'BG / Reverse <Light>',
      'colorDesc': '000000',
      'color': RColor.light_bg_reverse,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 120 Absolute <Light>',
      'colorDesc': '000000',
      'color': RColor.light_common_120,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 100 Primary <Light>',
      'colorDesc': '121314',
      'color': RColor.light_common_100,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 64 Secondary <Light>',
      'colorDesc': '5D6872',
      'color': RColor.light_common_64
    },
    {
      'text': 'Common / 32 Label <Light>',
      'colorDesc': 'B0B8BE',
      'color': RColor.light_common_32
    },
    {
      'text': 'Common / 16 Disable <Light>',
      'colorDesc': 'EBEBEB',
      'color': RColor.light_common_16
    },
    {
      'text': 'Common / 8 Line <Light>',
      'colorDesc': 'E1E5E9',
      'color': RColor.light_common_8
    },
    {
      'text': 'Common / 4 Field <Light>',
      'colorDesc': 'F4F6F8',
      'color': RColor.light_common_4
    },
    {
      'text': 'Common / 2 DisableBg <Light>',
      'colorDesc': 'FAFAFA',
      'color': RColor.light_common_2
    },
  ];

  final List<Map> _colorList = [
    {
      'text': 'White / Pure',
      'colorDesc': 'FFFFFF   100%',
      'color': RColor.white_pure,
      'fcolor': Colors.black,
    },
    {
      'text': 'White / Transparent',
      'colorDesc': 'FFFFFF   12%',
      'color': RColor.white_t,
      'fcolor': Colors.black,
    },
    {
      'text': 'Black / Pure',
      'colorDesc': '000000   100%',
      'color': RColor.black_pure,
      'fcolor': Colors.white,
    },
    {
      'text': 'Black / Transparent',
      'colorDesc': '000000   12%',
      'color': RColor.black_t,
      'fcolor': Colors.black,
    },
    {
      'text': 'Color / green',
      'colorDesc': '00CA9F   100%',
      'color': RColor.green,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / green heavy',
      'colorDesc': '00A179   100%',
      'color': RColor.green_heavy,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / green transparent',
      'colorDesc': '00CA9F   8%',
      'color': RColor.green_t,
      'fcolor': Colors.black,
    },
    {
      'text': 'Color / blue',
      'colorDesc': '00A5EB   100%',
      'color': RColor.blue,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / blue heavy',
      'colorDesc': '0084C7   100%',
      'color': RColor.blue_heavy,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / blue transparent',
      'colorDesc': '0084C7   8%',
      'color': RColor.blue_t,
      'fcolor': Colors.black,
    },
    {
      'text': 'Color / yellow',
      'colorDesc': 'FFBB08   100%',
      'color': RColor.yellow,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / yellow heavy',
      'colorDesc': 'DCB504   100%',
      'color': RColor.yellow_heavy,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / yellow transparent',
      'colorDesc': 'FFBB08   8%',
      'color': RColor.yellow_t,
      'fcolor': Colors.black,
    },
    {
      'text': 'Color / red',
      'colorDesc': 'EF4A41   100%',
      'color': RColor.red,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / red heavy',
      'colorDesc': 'CB2628   100%',
      'color': RColor.red_heavy,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / red transparent',
      'colorDesc': 'EF4A41   8%',
      'color': RColor.red_t,
      'fcolor': Colors.black,
    },
  ];

  Widget _buildColorItem({
    required String text,
    required String colorDesc,
    required Color color,
    Color? fcolor = Colors.black,
  }) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.center,
      color: color,
      width: 400,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: fcolor),
          ),
          Text(
            colorDesc,
            style: TextStyle(color: fcolor),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('color 展示')),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff3D3D3D),
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            children: [
              Wrap(
                children: [
                  Column(
                    children: _colorDarkList.map((e) {
                      return _buildColorItem(
                        text: e['text'],
                        colorDesc: e['colorDesc'],
                        color: e['color'],
                        fcolor: e['fcolor'],
                      );
                    }).toList(),
                  ),
                  Column(
                    children: _colorLightList.map((e) {
                      return _buildColorItem(
                        text: e['text'],
                        colorDesc: e['colorDesc'],
                        color: e['color'],
                        fcolor: e['fcolor'],
                      );
                    }).toList(),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                width: 400,
                child: Column(
                  children: _colorList.map((e) {
                    return _buildColorItem(
                      text: e['text'],
                      colorDesc: e['colorDesc'],
                      color: e['color'],
                      fcolor: e['fcolor'],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
