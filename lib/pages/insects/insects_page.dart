import 'package:flutter/material.dart';

import '../../components/list_view.dart';
import '../settings/swith_theme.dart';
import 'spiders_page.dart';

class InsectsPage extends StatefulWidget {
  const InsectsPage({Key? key}) : super(key: key);

  @override
  State<InsectsPage> createState() => _InsectsPageState();
}

class _InsectsPageState extends State<InsectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ContainerList(
            text: 'Spiders',
            image: AssetImage('assets/images/sb.jpg'),
            route: SpidersPage(),
          ),
        ],
      ),
    );
  }
}
