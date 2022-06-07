import 'package:explora_habitat/services/stores/page_store.dart';
import 'package:explora_habitat/ui/screens/create/create_theme/create_theme.dart';
import 'package:explora_habitat/ui/screens/response/responses_theme/responses_theme_screen.dart';
import 'package:explora_habitat/ui/screens/theme/my_theme_screen.dart';
import 'package:explora_habitat/ui/screens/theme/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();
    reaction(
      (_) => pageStore.page,
      (int page) => pageController.jumpToPage(page),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MyThemeScreen(),
          ThemeScreen(),
          ResponsesThemeScreen(),
          CreateThemeScreen(),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
