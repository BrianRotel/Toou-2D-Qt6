#version 310 es
precision highp float;

// 输入变量 (使用 layout 指定位置)
layout(location = 0) in vec2 qt_TexCoord0;

// 输出变量 (替代 gl_FragColor)
layout(location = 0) out vec4 fragColor;

// Uniform block - 包含所有非采样器 uniform
layout(std140, binding = 0) uniform UniformBlock {
    float qt_Opacity;
    vec4 color;
};

// 采样器 - 每个都需要显式绑定位置
layout(binding = 1) uniform sampler2D source;

void main() {
    // 使用现代纹理采样函数
    vec4 toou2d_svg_color = texture(source, qt_TexCoord0);

    // 计算源颜色分量 (防止除零)
    vec3 srcRgb = toou2d_svg_color.rgb / max(toou2d_svg_color.a, 0.00390625);

    // 计算目标颜色分量 (防止除零)
    vec3 dstRgb = color.rgb / max(color.a, 0.00390625);

    // 混合颜色 (使用线性插值)
    vec3 mixedRgb = mix(srcRgb, dstRgb, color.a);

    // 应用原始 alpha 并预乘
    vec4 result = vec4(mixedRgb * toou2d_svg_color.a, toou2d_svg_color.a);

    // 应用全局不透明度
    fragColor = result * qt_Opacity;
}
