import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'component/table.dart';

@RoutePage()
class PokerPage extends HookConsumerWidget {
  const PokerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return const Stack(
      children: [
        Center(child: PokerTable()),
      ],
    );
  }
}