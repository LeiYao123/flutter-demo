import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tablet/components/text/index.dart';

class OrderStatusTab extends StatefulWidget {
  final int activeIndex;
  final List<TabItem> tabs;
  final Function(int) onChange;
  final Function(String) onSearch;
  const OrderStatusTab({
    super.key,
    required this.activeIndex,
    required this.onChange,
    required this.tabs,
    required this.onSearch,
  });

  static final color = const Color(0xff888888);

  @override
  State<OrderStatusTab> createState() => _OrderStatusTabState();
}

class _OrderStatusTabState extends State<OrderStatusTab> {
  bool _isSearchMode = false;

  Widget _buildLine() {
    return Container(width: 1, color: const Color(0xff404040));
  }

  Widget _buildTabItem(int index, TabItem el) {
    final bgColor =
        widget.activeIndex == index ? const Color(0xff282828) : null;
    final textColor =
        widget.activeIndex == index ? Colors.white : OrderStatusTab.color;
    return InkWell(
      onTap: () => widget.onChange(index),
      child: Container(
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RuText(el.title, color: textColor, weight: FontWeight.w700),
            RuText(el.orderNum, color: textColor, weight: FontWeight.w700),
          ],
        ),
      ),
    );
  }

  // tab 列表
  List<Widget> _buildTabs() {
    return widget.tabs
        .mapIndexed((index, el) =>
            [Expanded(child: _buildTabItem(index, el)), _buildLine()])
        .expand((i) => i)
        .toList();
  }

  // 搜索框
  Widget _buildSearch() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        height: 46,
        child: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Type keyword to search',
            hintStyle: TextStyle(color: Color(0xff888888)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff404040),
              ),
            ),
          ),
          onChanged: (e) => _handleSearch(e),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff161616),
      height: 80,
      child: Row(
        children: [
          if (!_isSearchMode) ..._buildTabs(),
          if (_isSearchMode) _buildSearch(),
          InkWell(
            onTap: () => setState(() => _isSearchMode = !_isSearchMode),
            child: SizedBox(
              width: 80,
              child: Icon(
                _isSearchMode ? Icons.close : Icons.search,
                size: 24,
                color: OrderStatusTab.color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSearch(String text) {
    // 此处应做节流处理
    widget.onSearch(text);
  }
}

class TabItem {
  final String title;
  final int type;
  final int orderNum;

  TabItem(this.title, this.type, this.orderNum);
}
