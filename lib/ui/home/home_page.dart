import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../router/app_router.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _pokerButton(),
      ],
    );
  }

  Widget _pokerButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          appRouter.push(const PokerRoute());
        },
        child: const Text('Poker'),
      ),
    );
  }
}