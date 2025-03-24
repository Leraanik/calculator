#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QDebug>
#include <QDir>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QDir dir(":/");
    qDebug() << "Files in /:" << dir.entryList();

    int fontId = QFontDatabase::addApplicationFont(":/open-sans-semibold.ttf");
    if (fontId == -1) {
        qWarning() << "Не удалось загрузить шрифт!";
    } else {
        QStringList fontFamilies = QFontDatabase::applicationFontFamilies(fontId);
        qDebug() << "Загруженные шрифты:" << fontFamilies;
    }

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("calc", "Main");

    return app.exec();
}
