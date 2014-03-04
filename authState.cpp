#include "authState.h"

AuthState::AuthState(Encryption &enc, QObject *parent) :
    QObject(parent)
{
  this->enc = &enc;
}

bool AuthState::authUser(QString login, QString password)
{
  QThread th;
  th.start();
  QHash<QString, QVariant> _pars;
  _pars.insert("login", login);
  _pars.insert("password",  this->enc->encrypt(password));
  QList<QHash<QString, QVariant>> _res = SQLservice::executSQLreader(
        QString("SELECT password FROM User WHERE login = :login AND password = :password"), _pars);

  bool _isSucess = !_res.isEmpty();
  emit AuthState::authResult(_isSucess);
  return _isSucess;
}
