import 'package:flutter/material.dart';

import 'constants.dart';

class TabBarWidget extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> children;
  final TabController? controller;
  final int initialIndex;
  const TabBarWidget({
    super.key,
    required this.tabs,
    required this.children,
    this.controller,
    required this.initialIndex,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: widget.tabs.length);
    controller!.animateTo(widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          centerTitle: true,
          leading: null,
          automaticallyImplyLeading: false,
          backgroundColor: themeIsDark(context) ? bgDarkColor : bgColor,
          title: TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            indicatorColor: primaryColor,
            indicatorWeight: 3,
            tabs: widget.tabs,
          ),
          elevation: 0,
        ),
        body: TabBarView(
          controller: widget.controller,
          children: widget.children,
        ),
      ),
    );
  }
}
