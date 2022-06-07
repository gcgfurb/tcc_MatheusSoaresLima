import 'package:explora_habitat/services/stores/page_store.dart';
import 'package:explora_habitat/ui/components/custom_drawer/page_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PageSection extends StatelessWidget {
  PageSection({Key? key}) : super(key: key);

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Meus Temas',
          iconData: Icons.my_library_add,
          onTap: () => pageStore.setPage(0),
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: 'Temas',
          iconData: Icons.list,
          onTap: () => pageStore.setPage(1),
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: 'Respostas',
          iconData: Icons.question_answer,
          onTap: () => pageStore.setPage(2),
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: 'Criar tema',
          iconData: Icons.edit,
          onTap: () => pageStore.setPage(3),
          highlighted: pageStore.page == 3,
        ),
        // PageTile(
        //   label: 'Sobre',
        //   iconData: Icons.info,
        //   onTap: () => pageStore.setPage(4),
        //   highlighted: pageStore.page == 4,
        // ),
        // PageTile(
        //   label: 'Minha Conta',
        //   iconData: Icons.person,
        //   onTap: () => pageStore.setPage(5),
        //   highlighted: pageStore.page == 5,
        // ),
      ],
    );
  }
}
