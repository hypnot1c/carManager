#ifndef AUTHTHREAD_H
#define AUTHTHREAD_H

#include <QObject>
#include <QThread>

#include "encryption.h"
#include "authState.h"

class AuthThread : public QObject
{
  Q_OBJECT
public:
  AuthThread(const QString &login, const QString &password);

signals:
  void authResult(QVariant isSuccess);

public slots:
  void proccess();
  void end();

protected:
  void run();

private:
  QString _login;
  QString _password;
  Encryption *_enc;
};

#endif // AUTHTHREAD_H
