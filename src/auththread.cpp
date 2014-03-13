#include "auththread.h"

AuthThread::AuthThread(const QString &login, const QString &password)
{
  _login = login;
  _password = password;
}

void AuthThread::proccess() {
    QHash<QString, QVariant> _pars;
    _enc = new Encryption();
    _pars.insert("login", _login);
    _pars.insert("password",  _enc->encrypt(_password));
    QList<QHash<QString, QVariant>> _res = SQLservice::executSQLreader(
          QString("SELECT password FROM User WHERE login = :login AND password = :password"), _pars);
    bool _isSucess = !_res.isEmpty();
    emit AuthThread::authResult(_isSucess);
    return;
}

void AuthThread::end() {
  if(_enc != NULL)
    delete _enc;
}
