#ifndef SQLSERVICE_H
#define SQLSERVICE_H

#include <QtSql>
#include <QSettings>
#include <QHash>
#include <QList>
#include <QVariant>

class SQLservice
{
public:
  SQLservice();
  static QList<QHash<QString, QVariant>> executSQLreader(QString query, QHash<QString, QVariant> params);
  static QSqlDatabase getDatabase(const QString &connectionName = QString("localSQLite"));
};

#endif // SQLSERVICE_H
