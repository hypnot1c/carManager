#include <QtGui/QGuiApplication>
#include <QtSql>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setSource(QUrl("qrc:/qml/qml/carManager/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
