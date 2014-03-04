#include <QtGui/QGuiApplication>
#include <QQuickItem>
#include <QSettings>

#include "authState.h"
#include "authThread.h"
#include "encryption.h"
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QSettings _settings(QSettings::IniFormat, QSettings::UserScope, "DeveloperSoft", "carManager");
    _settings.setValue("dbPath", "resources/db/mainDB.db");
    Encryption _crp = Encryption();

    QtQuick2ApplicationViewer viewer;
    viewer.setSource(QUrl("qrc:/qml/qml/carManager/main.qml"));
    viewer.showExpanded();

    QObject *form = viewer.rootObject();
    AuthState* auth = new AuthState(form);
    QObject::connect(form, SIGNAL(authorizing(QString, QString)), auth, SLOT(beginAuthUser(QString,QString)), Qt::QueuedConnection);

    return app.exec();
}
