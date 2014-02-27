#include <QtGui/QGuiApplication>
#include <QtSql>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("resources/db/mainDB.db");
    if(!db.open())
      return -1;

    QSqlQuery qwr;

    //qwr.prepare(" SELECT * FROM User ");
    //qwr.bindValue(":login", "ahmed_@mail.ru");
    //qwr.bindValue(":password", "123456");

    bool res = qwr.exec(" SELECT * FROM User ");
    QSqlError err = qwr.lastError();
    if(!res)
      return -2;

    QtQuick2ApplicationViewer viewer;
    viewer.setSource(QUrl("qrc:/qml/qml/carManager/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
