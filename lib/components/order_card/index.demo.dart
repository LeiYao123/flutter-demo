import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tablet/components/text/index.dart';

import 'index.dart';

class OrderCardDemo extends StatefulWidget {
  const OrderCardDemo({super.key});

  @override
  State<OrderCardDemo> createState() => _OrderCardDemoState();
}

class _OrderCardDemoState extends State<OrderCardDemo> {
  int _activeIndex = 0;

  List<Widget> _buildOrderList() {
    List arr = List.generate(8, (index) => index);
    return arr.mapIndexed((index, element) {
      return OrderCard(
        isActive: _activeIndex == index,
        tagDesc: index == 2 ? null : '⏰ 23:59:59',
        title: 'Cameron W',
        desc: '1234 · Pickup',
        isAsap: index.isEven ? true : false,
        timeDesc: index.isEven ? null : '10:30 AM',
        onTap: () => setState(() => _activeIndex = index),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xff161616),
          width: 400,
          child: Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xff404040)),
                  ),
                ),
                child: const RuText('i am header', color: Colors.white),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: _buildOrderList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
