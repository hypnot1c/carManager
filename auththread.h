#ifndef AUTHTHREAD_H
#define AUTHTHREAD_H

#include <QObject>
#include <QThread>

#include "authState.h"

class AuthThread : public QThread
{
  Q_OBJECT
public:
  explicit AuthThread(QObject *form, QObject *parent = 0);

private:
  AuthState *_auth;
  QObject *_form;

public slots:
  bool beginUserAuth(QString, QString);
protected:
  void run();
};

#endif // AUTHTHREAD_H
