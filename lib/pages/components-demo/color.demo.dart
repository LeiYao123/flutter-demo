import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/style/color.dart';

class ColorDemoPage extends StatelessWidget {
  ColorDemoPage({super.key});

  final List<Map> _colorDarkList = [
    {
      'text': 'Text / Heavy <Dark>',
      'colorDesc': 'E9E9E9',
      'color': RuColor.textHeavy,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Medium <Dark>',
      'colorDesc': 'A9A9A9',
      'color': RuColor.textMedium,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Lite <Dark>',
      'colorDesc': '888888',
      'color': RuColor.textLite,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Reverse <Dark>',
      'colorDesc': '000000',
      'color': RuColor.textReverse,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Absolute <Dark>',
      'colorDesc': '000000',
      'color': RuColor.bgAbsolute,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Primary <Dark>',
      'colorDesc': '161616',
      'color': RuColor.bgPrimary,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Primary Elevated <Dark>',
      'colorDesc': '202020',
      'color': RuColor.bgPrimaryElevated,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Secondary <Dark>',
      'colorDesc': '282828',
      'color': RuColor.bgSecondary,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Tertiary <Dark>',
      'colorDesc': '363636',
      'color': RuColor.bgTertiary,
      'fcolor': Colors.white,
    },
    {
      'text': 'BG / Reverse <Dark>',
      'colorDesc': 'FFFFFF',
      'color': RuColor.bgReverse,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 120 Absolute <Dark>',
      'colorDesc': 'FFFFFF',
      'color': RuColor.common_120,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 100 Primary <Dark>',
      'colorDesc': 'E9E9E9',
      'color': RuColor.common_100,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 64 Secondary <Dark>',
      'colorDesc': 'A9A9A9',
      'color': RuColor.common_64,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 32 Label <Dark>',
      'colorDesc': '888888',
      'color': RuColor.common_32,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 16 Disable <Dark>',
      'colorDesc': '555555',
      'color': RuColor.common_16,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 8 Line <Dark>',
      'colorDesc': '404040',
      'color': RuColor.common_8,
      'fcolor': Colors.white,
    },
  ];

  final List<Map> _colorLightList = [
    {
      'text': 'Text / Heavy <Light>',
      'colorDesc': '121314',
      'color': RuColor.textHeavy,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Medium <Light>',
      'colorDesc': '5D6872',
      'color': RuColor.textMedium,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Lite <Light>',
      'colorDesc': 'B0B8BE',
      'color': RuColor.textLite,
      'fcolor': Colors.white,
    },
    {
      'text': 'Text / Reverse <Light>',
      'colorDesc': 'FFFFFF',
      'color': RuColor.textReverse
    },
    {
      'text': 'BG / Absolute <Light>',
      'colorDesc': 'FFFFFF',
      'color': RuColor.bgAbsolute
    },
    {
      'text': 'BG / Primary <Light>',
      'colorDesc': 'FFFFFF',
      'color': RuColor.bgPrimary
    },
    {
      'text': 'BG / Primary Elevated <Light>',
      'colorDesc': 'FFFFFF',
      'color': RuColor.bgPrimaryElevated
    },
    {
      'text': 'BG / Secondary <Light>',
      'colorDesc': 'FAFBFC',
      'color': RuColor.bgSecondary
    },
    {
      'text': 'BG / Tertiary <Light>',
      'colorDesc': 'FAFAFA',
      'color': RuColor.bgTertiary
    },
    {
      'text': 'BG / Reverse <Light>',
      'colorDesc': '000000',
      'color': RuColor.bgReverse
    },
    {
      'text': 'Common / 120 Absolute <Light>',
      'colorDesc': '000000',
      'color': RuColor.common_120,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 100 Primary <Light>',
      'colorDesc': '121314',
      'color': RuColor.common_100,
      'fcolor': Colors.white,
    },
    {
      'text': 'Common / 64 Secondary <Light>',
      'colorDesc': '5D6872',
      'color': RuColor.common_64
    },
    {
      'text': 'Common / 32 Label <Light>',
      'colorDesc': 'B0B8BE',
      'color': RuColor.common_32
    },
    {
      'text': 'Common / 16 Disable <Light>',
      'colorDesc': 'EBEBEB',
      'color': RuColor.common_16
    },
    {
      'text': 'Common / 8 Line <Light>',
      'colorDesc': 'E1E5E9',
      'color': RuColor.common_8
    },
    {
      'text': 'Common / 4 Field <Light>',
      'colorDesc': 'F4F6F8',
      'color': RuColor.common_4
    },
    {
      'text': 'Common / 2 DisableBg <Light>',
      'colorDesc': 'FAFAFA',
      'color': RuColor.common_2
    },
  ];

  final List<Map> _colorList = [
    {
      'text': 'White / Pure',
      'colorDesc': 'FFFFFF   100%',
      'color': RuColor.whitePure,
      'fcolor': Colors.black,
    },
    {
      'text': 'White / Transparent',
      'colorDesc': 'FFFFFF   12%',
      'color': RuColor.whiteTransparent,
      'fcolor': Colors.black,
    },
    {
      'text': 'Black / Pure',
      'colorDesc': '000000   100%',
      'color': RuColor.blackPure,
      'fcolor': Colors.white,
    },
    {
      'text': 'Black / Transparent',
      'colorDesc': '000000   12%',
      'color': RuColor.blackTransparent,
      'fcolor': Colors.black,
    },
    {
      'text': 'Color / green',
      'colorDesc': '00CA9F   100%',
      'color': RuColor.green,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / green heavy',
      'colorDesc': '00A179   100%',
      'color': RuColor.greenHeavy,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / green transparent',
      'colorDesc': '00CA9F   8%',
      'color': RuColor.greenTransparent,
      'fcolor': Colors.black,
    },
    {
      'text': 'Color / blue',
      'colorDesc': '00A5EB   100%',
      'color': RuColor.blue,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / blue heavy',
      'colorDesc': '0084C7   100%',
      'color': RuColor.blueHeavy,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / blue transparent',
      'colorDesc': '0084C7   8%',
      'color': RuColor.blueTransparent,
      'fcolor': Colors.black,
    },
    {
      'text': 'Color / yellow',
      'colorDesc': 'FFBB08   100%',
      'color': RuColor.yellow,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / yellow heavy',
      'colorDesc': 'DCB504   100%',
      'color': RuColor.yellowHeavy,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / yellow transparent',
      'colorDesc': 'FFBB08   8%',
      'color': RuColor.yellowTransparent,
      'fcolor': Colors.black,
    },
    {
      'text': 'Color / red',
      'colorDesc': 'EF4A41   100%',
      'color': RuColor.red,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / red heavy',
      'colorDesc': 'CB2628   100%',
      'color': RuColor.redHeavy,
      'fcolor': Colors.black,
    },
    {
      'text': '🤔Color / red transparent',
      'colorDesc': 'EF4A41   8%',
      'color': RuColor.redTransparent,
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.center,
      color: color,
      height: 70,
      // width: 498,
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
    final colors1 = Get.isDarkMode ? _colorDarkList : _colorLightList;
    return Scaffold(
      appBar: AppBar(title: const Text('color 展示')),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff3D3D3D),
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: colors1.map((e) {
                    return _buildColorItem(
                      text: e['text'],
                      colorDesc: e['colorDesc'],
                      color: e['color'],
                      fcolor: e['fcolor'],
                    );
                  }).toList(),
                ),
              ),
              Expanded(
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
