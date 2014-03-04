#include "encryption.h"

Encryption::Encryption()
{
  if (QCA::isSupported("aes128-cbc-pkcs7"))
  {
      this->_symmetricKey = QByteArray("b0572e7c2e5bbc12ad20a03f39791607");
  }
}

QByteArray Encryption::getSymmetricKey()
{
  return Encryption::_symmetricKey;
}

QByteArray Encryption::encrypt(const QString &input)
{
  QByteArray res;
  Initializer init;
  SecureArray arg = QVariant(input).toByteArray();
  Cipher cp(("aes128"), Cipher::CBC, Cipher::DefaultPadding);
  cp.setup(Encode, this->_symmetricKey, InitializationVector(this->_symmetricKey));
  SecureArray u = cp.process(arg);
  if (!cp.ok())
  {
    return res;
  }
  res = u.toByteArray();
  return res;
}

QString Encryption::decrypt(QByteArray &input)
{
  QString res;
  //инициализация
  Initializer init;
  Cipher cp(("aes128"), Cipher::CBC, Cipher::DefaultPadding);
  cp.setup(Decode, this->_symmetricKey, InitializationVector(this->_symmetricKey));
  SecureArray u = cp.process(input);
  if (!cp.ok())
  {
    return res;
  }
  res = QString(u.data());
  return res;
}
