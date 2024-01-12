import 'dart:ui';

import 'package:flutter/material.dart';

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
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.6,
          color: Colors.transparent,
        ),
      );
    }
  }
}
