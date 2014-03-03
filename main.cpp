#include <QtGui/QGuiApplication>
#include <QQuickItem>
#include <QSettings>

#include "authState.h"
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QSettings _settings(QSettings::IniFormat, QSettings::UserScope, "DeveloperSoft", "carManager");
    _settings.setValue("dbPath", "resources/db/mainDB.db");

    QtQuick2ApplicationViewer viewer;
    viewer.setSource(QUrl("qrc:/qml/qml/carManager/main.qml"));
    viewer.showExpanded();

    AuthState auth;
    QObject *form = viewer.rootObject();
    QObject::connect(form, SIGNAL(authorizing(QString, QString)), &auth, SLOT(authUser(QString,QString)));
    QObject::connect(&auth, SIGNAL(authResult(QVariant)), form, SLOT(authResult(QVariant)));

    return app.exec();
}
