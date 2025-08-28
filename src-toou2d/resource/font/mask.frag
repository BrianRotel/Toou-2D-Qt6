#version 450

precision mediump float;

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

// 将采样器放在 uniform 块中
layout(binding = 1) uniform sampler2D source;
layout(binding = 2) uniform sampler2D maskSource;

// 其他 uniform 变量可以放在另一个块中
layout(std140, binding = 0) uniform UniformBlock {
    float qt_Opacity;
};

void main() {
    // fragColor = texture(source, qt_TexCoord0)
    //             * texture(maskSource, qt_TexCoord0).a
    //             * qt_Opacity;
    fragColor = vec4(1.0, 0.0, 0.0, 1.0); // 显示红色
}
