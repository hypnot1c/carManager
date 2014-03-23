#include <QtGui/QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QSettings>

#include "src/authState.h"
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QSettings _settings(QSettings::IniFormat, QSettings::UserScope, "DeveloperSoft", "carManager");
    _settings.setValue("dbPath", "db/mainDB.db");


    QQmlApplicationEngine eng;
    eng.load(QUrl("qrc:/qml/qml/carManager/main.qml"));

//    QtQuick2ApplicationViewer viewer;
//    viewer.setSource(QUrl("qrc:/qml/qml/carManager/main.qml"));
//    viewer.showExpanded();

    //QObject *form = eng.rootObjects().value(0);
    //AuthState* auth = new AuthState(form);
    //QObject::connect(form, SIGNAL(authorizing(QString, QString)), auth, SLOT(beginAuthUser(QString,QString)), Qt::QueuedConnection);

    int res = app.exec();
    return res;
}
