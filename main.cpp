#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickItem>
#include <QtQml>
#include <QFontDatabase>
#include <stdio.h>
#include "pulu.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QFontDatabase database;
    int id = database.addApplicationFont("/usr/lib/fonts/DejaVuSans.ttf");
    if (id != -1){
        QStringList families = QFontDatabase::applicationFontFamilies(id);
        QGuiApplication::setFont(QFont(families.at(0)));
    }

    // get the target setting from the .pro-file:
#if defined(TARGET_ARM)
    bool targetARM = true;
#else
    // virtual machine
    bool targetARM = false;
#endif

    qmlRegisterType<Pulu>("com.kr", 1, 0, "Pulu");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    // this will set the "targetARM" property to true if the software is built for ARM
    QObject *rootObject = engine.rootObjects().first();
    rootObject->setProperty("targetARM", targetARM);

    printf("asdasd\n");
    return app.exec();
}

