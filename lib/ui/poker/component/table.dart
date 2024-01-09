import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../../util/shader_util.dart';
import '../../common/shader_painter.dart';

class PokerTable extends StatefulWidget {
  const PokerTable({super.key});

  @override
  State<PokerTable> createState() => _PokerTable();
}

class _PokerTable extends State<PokerTable> {
  FragmentShader? shader;

  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    shader = await loadFragmentShader('shaders/poker_table.frag');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if(shader == null) {
      return const SizedBox();
    } else {
      return CustomPaint(
        painter: ShaderPainter(shader!),
        child: Container(),
      );
    }
  }
}
