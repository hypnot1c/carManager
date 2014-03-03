#include "authState.h"
#include "encryption.h"
#include "sqlservice.h"

AuthState::AuthState(QObject *parent) :
    QObject(parent)
{
}

bool AuthState::authUser(QString login, QString password)
{
  QHash<QString, QVariant> _pars;
  _pars.insert("login", login);
  //_pars.insert("password",  Encryption::encrypt(password));
  QList<QHash<QString, QVariant>> _res = SQLservice::executSQLreader(
        QString("SELECT password FROM User WHERE login = :login AND password = :password"), _pars);

  bool _isSucess = !_res.isEmpty();
  emit AuthState::authResult(_isSucess);
  return _isSucess;
}
