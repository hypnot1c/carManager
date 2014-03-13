#ifndef AUTHSTATE_H
#define AUTHSTATE_H

#include <QObject>
#include <QVariant>
#include "sqlservice.h"

class AuthState : public QObject
{
    Q_OBJECT
public:
  AuthState(QObject* form);

public slots:
  bool beginAuthUser(QString login, QString password);

private:
  QObject* _form;
};

#endif // AUTH_H
