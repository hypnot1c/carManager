#ifndef ENCRYPTION_H
#define ENCRYPTION_H

#include <QtCrypto>

class Encryption
{
private:
  static QByteArray _symmetricKey;
public:
  Encryption();
  static QByteArray getSymmetricKey();
  static QByteArray encrypt (const QString &input);
  static QString decrypt (QByteArray &input);
};

#endif // ENCRYPTION_H
