#ifndef ENCRYPTION_H
#define ENCRYPTION_H

#include <QtCrypto>

class Encryption
{
private:
  QByteArray _symmetricKey;
  QCA::Initializer _initator;
  QByteArray getSymmetricKey();
public:
  Encryption();
  QByteArray encrypt (const QString &input);
  QString decrypt (QByteArray &input);
};

#endif // ENCRYPTION_H
