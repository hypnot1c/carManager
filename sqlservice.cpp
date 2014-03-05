#include "sqlservice.h"

SQLservice::SQLservice()
{
}

QSqlDatabase SQLservice::getDatabase(const QString &connectionName)
{
  return QSqlDatabase::contains(connectionName) ? QSqlDatabase::database(connectionName) : QSqlDatabase::addDatabase("QSQLITE", connectionName);
}

QList<QHash<QString, QVariant>> SQLservice::executSQLreader(QString query, QHash<QString, QVariant> params = QHash<QString, QVariant>())
{
  QList<QHash<QString, QVariant> > _result;

{
  QSqlDatabase _db = SQLservice::getDatabase();
  QSettings _settings(QSettings::IniFormat, QSettings::UserScope, "DeveloperSoft", "carManager");

  _db.setDatabaseName(_settings.value("dbPath").toString());
  if(!_db.open())
    return _result;

  QSqlQuery qwr(_db);
  qwr.prepare(query);

  for(auto _par : params.keys())
    qwr.bindValue(":" + _par, params.value(_par));

  bool _res = qwr.exec();
  if(!_res)
    return _result;

  QSqlRecord rec = qwr.record();
  while(qwr.next())
  {
    QHash<QString, QVariant> row;
    for(int _i = 0; _i < rec.count(); _i++)
      row.insert(rec.fieldName(_i), qwr.value(_i));
    _result.append(row);
  }
  _db.close();
  }
  return _result;
}
