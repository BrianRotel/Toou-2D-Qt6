#version 310 es
precision highp float;

// 输入变量
layout(location = 0) in vec2 qt_TexCoord0;

// 输出变量
layout(location = 0) out vec4 fragColor;

// Uniform block 包含所有非采样器 uniform
layout(std140, binding = 0) uniform QtBlock {
    float qt_Opacity;
};

// 采样器 - 每个都需要显式绑定位置
layout(binding = 1) uniform sampler2D source;
layout(binding = 2) uniform sampler2D maskSource;

void main() {
    vec4 sourceColor = texture(source, qt_TexCoord0);
    float maskAlpha = texture(maskSource, qt_TexCoord0).a;

    fragColor = sourceColor * maskAlpha * qt_Opacity;
}
