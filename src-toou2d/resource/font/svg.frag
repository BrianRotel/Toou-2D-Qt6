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
    // 调试代码：在特定条件下显示不同颜色
    // 使用现代纹理采样函数
    // vec4 toou2d_svg_color = texture(source, qt_TexCoord0);
    // fragColor = vec4(mix(toou2d_svg_color.rgb/max(toou2d_svg_color.a, 0.00390625), color.rgb/max(color.a, 0.00390625), color.a) * toou2d_svg_color.a, toou2d_svg_color.a) * qt_Opacity;
    // #ifdef DEBUG
    // if (qt_TexCoord0.x < 0.1 && qt_TexCoord0.y < 0.1) {
    fragColor = vec4(1.0, 0.0, 0.0, 1.0); // 显示红色
    // }
    // #endif
}
