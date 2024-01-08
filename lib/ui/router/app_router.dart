import 'package:auto_route/auto_route.dart';

import '../home/home_page.dart';
import '../poker/poker_page.dart';

part 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Page,Route',)
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: PokerRoute.page),
  ];
}