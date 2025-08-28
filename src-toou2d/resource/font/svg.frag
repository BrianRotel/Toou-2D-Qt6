#version 450 // 为 Vulkan 使用更高的 GLSL 版本，例如 450
layout(location = 0) in vec2 qt_TexCoord0;
// 注意：顶点着色器需要将 color 传递过来，或者我们也通过 Uniform Block 传递 color
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec4 color; // 现在 color 是 Uniform Block 内的成员
} u_color; // 您原有的 Uniform Block

layout(binding = 1) uniform sampler2D source; // source 是 Opaque 类型，允许在 Block 外

void main() {
    vec4 toou2d_svg_color = texture(source, qt_TexCoord0);
    // 使用 u_color.color 来访问 Uniform Block 中的 color 变量
    fragColor = vec4(mix(toou2d_svg_color.rgb/max(toou2d_svg_color.a, 0.00390625), u_color.color.rgb/max(u_color.color.a, 0.00390625), u_color.color.a) * toou2d_svg_color.a, toou2d_svg_color.a) * u_color.qt_Opacity;
}

