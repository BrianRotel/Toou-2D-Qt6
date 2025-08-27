#include "tcolor.h"

TColor* TColor::m_instance = nullptr;

QColor TColor::random() const
{
    return QColor(cpprandom(1, 255), cpprandom(1, 255), cpprandom(1, 255), cpprandom(1, 255));
}

QColor TColor::primary() const
{
    return QColor(0x40, 0x9E, 0xFF);
}

QColor TColor::primaryLight() const
{
    return QColor(0xDA, 0xEC, 0xFE);
}

QColor TColor::success() const
{
    return QColor(0x67, 0xC2, 0x3A);
}

QColor TColor::successLight() const
{
    return QColor(0xE1, 0xF2, 0xD9);
}

QColor TColor::warning() const
{
    return QColor(0xE6, 0xA2, 0x3C);
}

QColor TColor::warningLight() const
{
    return QColor(0xFA, 0xEC, 0xD9);
}

QColor TColor::danger() const
{
    return QColor(0xF5, 0x6C, 0x6C);
}

QColor TColor::dangerLight() const
{
    return QColor(0xFC, 0xE2, 0xE2);
}

QColor TColor::info() const
{
    return QColor(0x90, 0x93, 0x99);
}

QColor TColor::infoLight() const
{
    return QColor(0xE9, 0xE9, 0xEB);
}

/*!
    \class TColor
    \brief The qml singleton

  \sa TColor
  */
QObject *TColor::exampleQmlSingletonType(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    if(TColor::m_instance == nullptr){
        TColor::m_instance = new TColor;
    }

    return TColor::m_instance;
}
