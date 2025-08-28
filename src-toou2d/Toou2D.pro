QT          += qml quick svg shadertools
CONFIG      += plugin c++11
TEMPLATE    = lib
TARGET      = Toou2D
TARGET      = $$qtLibraryTarget($$TARGET)
uri         = Toou2D

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
SHADER_FILES = resource/font/mask.frag  resource/font/svg.frag
for(shader, SHADER_FILES) {
   # 定义输出文件
   OUTPUT_FILE = $${shader}.qsb
   # 构建编译命令
   COMPILE_CMD = qsb --glsl \"100 es,120,150\" --hlsl 50 --msl 12 -o $${OUTPUT_FILE} $${shader}
   # 打印调试信息（可选）
   message(Compiling $${shader} to $${OUTPUT_FILE})
   # 执行编译命令
   system($${COMPILE_CMD})
}
##########################################
CONFIG += sharedlib  # staticlib or sharedlib
#** 多次切换编译构建模式，建议先清理缓存。项目右键->清理

#*[staticlib] 构建静态库.a
#需要修改example.pro，请打开后按说明操作

#*[sharedlib] 构建动态库 .dll .so .dylib
#会自动安装到Qt qmlplugin目录中
#无需其它配置即可运行demo以及其它项目中使用
#发布目标平台前必须每个平台都要构建一次。
##########################################

RESOURCES += \
    t2d_res.qrc

# Input
HEADERS += \
        qml_plugin.h \
        Toou2D.h \
        t2d.h \
        def.h \
        world.h \
        theme/theme_binder.h \
        theme/theme_handler.h \
        theme/ThemeManager.h \
        controls/interface/ttoastitem.h \
        controls/interface/tdialogitem.h \
        controls/gadget/tgadgetlabel.h \
        controls/gadget/tgadgetborder.h \
        controls/gadget/tgadgetbackground.h \
        controls/gadget/tgadgeticon.h \
        controls/gadget/tgadgetscrollbar.h \
        controls/gadget/tgadgetitem.h \
        controls/gadget/tcolor.h


SOURCES += \
        qml_plugin.cpp \
        toou2d.cpp \
        t2d.cpp \
        def.cpp \
        world.cpp \
        theme/theme_binder.cpp \
        theme/theme_handler.cpp \
        theme/ThemeManager.cpp \
        controls/interface/ttoastitem.cpp \
        controls/interface/tdialogitem.cpp \
        controls/gadget/tgadgetlabel.cpp \
        controls/gadget/tgadgetborder.cpp \
        controls/gadget/tgadgetbackground.cpp \
        controls/gadget/tgadgeticon.cpp \
        controls/gadget/tgadgetscrollbar.cpp \
        controls/gadget/tgadgetitem.cpp \
        controls/gadget/tcolor.cpp


DEFINES += VERSION_IN=\\\"1.0.1\\\"
DEFINES += URI_STR=\\\"$$uri\\\"

contains(QMAKE_HOST.os,Windows) {
    include(./build_windows.pri)
}else{
    include(./build_macos.pri)
}

message("-----------------------------")
message("Toou 技术交流QQ群:244808")
message("http://www.toou.net")
message("1. 构建")
message("2. 运行")
message("先构建再运行，人生路必定赢")
message("-----------------------------")
