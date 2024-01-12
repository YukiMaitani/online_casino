#include <flutter/runtime_effect.glsl>

uniform vec2 uResolution;

out vec4 fragColor;

float sstep(float x) {
    return smoothstep(0.99, 1.01, x);
}

float circle(vec2 p, float r) {
    return sstep(length(vec2(p.x * uResolution.x/uResolution.y , p.y)) + (1.0 - r));
}

float rectangle(vec2 p, vec2 size) {
    return sstep(max(abs(p.x / size.x), abs(p.y / size.y)));
}

float ellipse(vec2 p) {
    float rectW = (uResolution.x - uResolution.y) / uResolution.x;
    return rectangle(p, vec2(rectW,1.0)) * circle(p + vec2(rectW,0), 1.0) * circle(p - vec2(rectW,0), 1.0);
}

float donut(vec2 p, float outside, float inside) {
    return ellipse(p * inside) - ellipse(p * outside);
}

void main() {
    vec2 uv = vec2(FlutterFragCoord().x/uResolution.x, 1-FlutterFragCoord().y/uResolution.y);
    uv = uv * 2 -1.;
    vec4 col = vec4(0);

    col += donut(uv, 1.0, 1.1) * vec4(.01,.15,.1,1.0);
    col += donut(uv, 1.1, 1.11) * vec4(.23,.57,.47,1.0);
    col += donut(uv, 1.11, 1.5) * vec4(0,.22,.14,1.0);
    col += (1.0 - ellipse(uv * 1.5)) * vec4(.13,.52,.42,1.0);
    fragColor = col;
}