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
  static QList<QHash<QString, QVariant>> executSQLreader(QString query);
  static QList<QHash<QString, QVariant>> executSQLreader(QString query, QMap<QString, QVariant> params);
};

#endif // SQLSERVICE_H
