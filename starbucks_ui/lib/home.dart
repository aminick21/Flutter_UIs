import 'package:flutter/material.dart';
import 'package:starbucks_ui/widgets/logo.dart';
import 'package:starbucks_ui/widgets/page_view.dart';
import 'package:starbucks_ui/widgets/tool_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children: [
            ToolBar(),
            BuildLogo(),
            BuildPages(),

          ],
        ),
      ),
      );
  }
}
