# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

TEMPLATE = app
QT += qml quick widgets
SOURCES += main.cpp \
    pulu.cpp \
    ui.cpp

RESOURCES += qml.qrc

#######################################################
# CrossControl specific libraries
# REMOVE DEPENDENCIES THAT ARE NOT USED

unix:{

DEFINES  += LINUX
DEFINES  += CCAUX

MY_QT_INSTALL_PREFIX=$$[QT_INSTALL_PREFIX]
QMAKE_CXXFLAGS += -Wno-psabi

linux-arm-g++ { # Qt4 Arm
    message(Compiling for Qt-4.8.4 Linux ARM)
    INCLUDEPATH += /opt/XA/include
    LIB_PATH = /opt/XA/usr/lib
}


inux-arm-none-gnueabi-g++ { # Qt5 Arm

    DEFINES +=TARGET_ARM=“1”
    INCLUDEPATH += /opt/XA/include
    LIB_PATH = /opt/mtcc/imx5/Qt-5.4.0/lib

    # Qt 5.6 imx5 XA/XS
    equals(MY_QT_INSTALL_PREFIX,"/opt/XA/Qt-5.6.3"){
        message(Compiling for Qt-5.6.3 Linux ARM XA/XS)
        INCLUDEPATH = /opt/XA/Qt-5.6.3/include
        INCLUDEPATH += /opt/XA/usr/include
        INCLUDEPATH += /opt/mtcc/imx5/include
        LIB_PATH = /opt/mtcc/imx5/Qt-5.6.3/lib
    }

    # Qt 5.4 imx5 XA/XS
    equals(MY_QT_INSTALL_PREFIX,"/opt/XA/Qt-5.4.0"){
        message(Compiling for Qt-5.4.0 Linux ARM XA/XS)
        INCLUDEPATH += /opt/XA/Qt-5.4.0/include
    }

    # Qt 5.6 imx5 VC
    equals(MY_QT_INSTALL_PREFIX,"/opt/VC/Qt-5.6.3"){
        message(Compiling for Qt-5.6.3 Linux ARM VC)
        INCLUDEPATH = /opt/VC/Qt-5.6.3/include
        INCLUDEPATH += /opt/VC/usr/include
        INCLUDEPATH += /opt/mtcc/imx5/include
        LIB_PATH = /opt/mtcc/imx5/Qt-5.6.3/lib
    }

    # Qt 5.4 imx5 VC
    equals(MY_QT_INSTALL_PREFIX,"/opt/VC/Qt-5.4.0"){
        message(Compiling for Qt-5.4.0 Linux ARM VC)
        INCLUDEPATH += /opt/VC/Qt-5.4.0/include
    }

    # Qt 5.6 imx5 VA
    equals(MY_QT_INSTALL_PREFIX,"/opt/VA/Qt-5.6.3"){
        message(Compiling for Qt-5.6.3 Linux ARM VA)
        INCLUDEPATH = /opt/VA/Qt-5.6.3/include
        INCLUDEPATH += /opt/VA/usr/include
        INCLUDEPATH += /opt/mtcc/imx5/include
        LIB_PATH = /opt/mtcc/imx5/Qt-5.6.3/lib
    }

    # Qt 5.4 imx5 VA
    equals(MY_QT_INSTALL_PREFIX,"/opt/VA/Qt-5.4.0"){
        message(Compiling for Qt-5.4.0 Linux ARM VA)
        INCLUDEPATH += /opt/VA/Qt-5.4.0/include
    }
}


linux-g++ { # Qt4 & Qt5 x86

    DEFINES +=TARGET_X86=“1”
    LIB_PATH = /opt/lib
    INCLUDEPATH += /opt/mtcc/include

    # Qt 5.6 x86 VM
    equals(MY_QT_INSTALL_PREFIX,"/opt/Qt-5.6.3"){
        message(Compiling for Qt-5.6.3 Linux x86)
        INCLUDEPATH += /opt/Qt-5.6.3/include
    }

    # Qt 5.4 x86 VM
    equals(MY_QT_INSTALL_PREFIX,"/opt/Qt-5.4.0/5.4/gcc"){
        message(Compiling for Qt-5.4.0 Linux x86)
        INCLUDEPATH += /opt/Qt-5.4.0/include
    }

    # Qt 4.8 x86 VM
    equals(MY_QT_INSTALL_PREFIX,"/opt/qt-4.8.4"){
        message(Compiling for Qt-4.8.4 Linux x86)
        INCLUDEPATH += /opt/qt-4.8.4/include
    }

    INCLUDEPATH += /opt/mtcc/include
}

linux-g++-32 { # Qt5 XM2
    message(Compiling for Linux x86 CCpilot XM2)
    LIB_PATH = /opt/lib
    INCLUDEPATH += /opt/XM2/include
    INCLUDEPATH += /opt/XM2/Qt-5.4.0/include
}

# Uncomment library below if used. Sapcore is required for 
# DataEngine and cc-aux2 is used for HW interface access
#LIBS += -L$$LIB_PATH -lcc-aux2
#LIBS += -L$$LIB_PATH -lsapcore
}

win32:{
LIB_PATH = c:/mtcc/lib
INCLUDEPATH += c:/mtcc/include
}

# Installation path
# target.path =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    pulu.h \
    ui.h

