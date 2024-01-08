import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pokerViewModelProvider =
    ChangeNotifierProvider((ref) => PokerViewModel());

class PokerViewModel extends ChangeNotifier {
  PokerViewModel();
}