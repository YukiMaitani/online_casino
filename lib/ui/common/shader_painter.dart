import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:online_casino/util/shader_util.dart';

class ShaderPainter extends CustomPainter {
  ShaderPainter(this.shader, {this.uniforms = const [], this.repaint = true});

  final FragmentShader shader;
  final List<dynamic> uniforms;
  final bool repaint;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.shader = shader..setUniforms([size, ...uniforms]);
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => repaint;
}