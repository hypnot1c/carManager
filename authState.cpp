#include "authState.h"
#include "sqlservice.h"

AuthState::AuthState(QObject *parent) :
    QObject(parent)
{
}

bool AuthState::authUser(QString login, QString password)
{
  QList<QHash<QString, QVariant>> _res = SQLservice::executSQLreader(
        QString("SELECT password FROM User WHERE login = 'ahmed_@mail.ru'"));

  QHash<QString, QVariant> row = _res.first();
  return true;
}
