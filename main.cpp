#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickItem>
#include <QtQml>
#include <QFontDatabase>
#include <stdio.h>
#include "pulu.h"
#include "ui.h"


void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    QByteArray localMsg = msg.toLocal8Bit();
    const char *file = context.file ? context.file : "";
    const char *function = context.function ? context.function : "";
    switch (type) {
    case QtDebugMsg:
        fprintf(stderr, "Debug: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        Ui::instance()->statusLog(msg);
        break;
    case QtInfoMsg:
        fprintf(stderr, "Info: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    case QtWarningMsg:
        fprintf(stderr, "Warning: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    case QtCriticalMsg:
        fprintf(stderr, "Critical: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    case QtFatalMsg:
        fprintf(stderr, "Fatal: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    }
}

int main(int argc, char *argv[])
{

    setbuf(stdout, NULL);
    qInstallMessageHandler(myMessageOutput);

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
    engine.rootContext()->setContextProperty("pulu", Pulu::instance());
    engine.rootContext()->setContextProperty("ui", Ui::instance());
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    // this will set the "targetARM" property to true if the software is built for ARM
    QObject *rootObject = engine.rootObjects().first();
    rootObject->setProperty("targetARM", targetARM);

    return app.exec();
}

