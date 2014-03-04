#ifndef AUTHSTATE_H
#define AUTHSTATE_H

#include <QObject>
#include <QVariant>
#include "encryption.h"
#include "sqlservice.h"

class AuthState : public QObject
{
    Q_OBJECT
public:
  explicit AuthState(Encryption &enc, QObject *parent = 0);
private:
  Encryption *enc;
signals:
  void authResult(QVariant isSuccess);
public slots:
  bool authUser(QString login, QString password);
};

#endif // AUTH_H
