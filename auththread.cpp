#include "auththread.h"
#include "authState.h"

AuthThread::AuthThread(QObject *form, QObject* parent) : QThread(parent), _auth()
{
  this->_form = form;
}

void AuthThread::run() {
  QObject::connect(&this->_auth, SIGNAL(authResult(QVariant)), this->_form, SLOT(authResult(QVariant)), Qt::QueuedConnection);

  exec();
}

bool AuthThread::beginUserAuth()
{
  AuthState _auth;
}
