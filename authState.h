#ifndef AUTHSTATE_H
#define AUTHSTATE_H

#include <QObject>
#include <QVariant>

class AuthState : public QObject
{
    Q_OBJECT
public:
    explicit AuthState(QObject *parent = 0);

signals:
  void authResult(QVariant isSuccess);
public slots:
  bool authUser(QString login, QString password);
};

#endif // AUTH_H
