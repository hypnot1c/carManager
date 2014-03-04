#ifndef ENCRYPTION_H
#define ENCRYPTION_H

#include <QtCrypto>

using namespace QCA;

class Encryption
{
private:
  QByteArray _symmetricKey;
  Initializer _initator;
  QByteArray getSymmetricKey();
public:
  Encryption(Initializer initiator);
  QByteArray encrypt (const QString &input);
  QString decrypt (QByteArray &input);
};

#endif // ENCRYPTION_H
