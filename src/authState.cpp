#include "authState.h"
#include "auththread.h"

AuthState::AuthState(QObject* form)
{
  _form = form;
}

bool AuthState::beginAuthUser(QString login, QString password)
{
   AuthThread* auth = new AuthThread(login, password);
   QThread* thread = new QThread();
   auth->moveToThread(thread);
   connect(thread, SIGNAL(started()), auth, SLOT(proccess()));
   connect(auth, SIGNAL(authResult(QVariant)), thread, SLOT(quit()));
   connect(auth, SIGNAL(authResult(QVariant)), _form, SLOT(authResult(QVariant)));
   thread->start();
  return true;
}
