#include "encryption.h"

Encryption::Encryption()
{
  if (QCA::isSupported("aes128-cbc-pkcs7"))
  {
      this->_symmetricKey = QByteArray("b0572e7c2e5bbc12ad20a03f39791607");
      this->_initator = QCA::Initializer();
  }
}

QByteArray Encryption::getSymmetricKey()
{
  return Encryption::_symmetricKey;
}

QByteArray Encryption::encrypt(const QString &input)
{
  QByteArray res;
  QCA::SymmetricKey _key(this->getSymmetricKey());
  QCA::InitializationVector _initVector(_key);
  //инициализация
    //переводим строку в засекречивамый массив
    QCA::SecureArray arg = QVariant(input).toByteArray();

    QCA::Cipher _cipher(QString("aes128"), QCA::Cipher::CBC, QCA::Cipher::DefaultPadding, QCA::Encode, _key, _initVector);
    QCA::SecureArray u = _cipher.process(arg);
    if (!_cipher.ok())
    {
       return res;
    }
    res = u.toByteArray();
    return res;
}

//QString Encryption::decrypt(QByteArray &input)
//{
//  QString res;
//  //инициализация
//    QCA::Initializer init;
//    QCA::SymmetricKey _key(Encryption::getSymmetricKey());
//    QCA::InitializationVector _initVector(_key);
//    //переводим строку в засекречивамый массив
//    // проверка что поддерживаем алгоритм AES128 testing
//    if (QCA::isSupported("aes128-cbc-pkcs7"))
//    {
//     //содать 128 битный AES шифр объект используя CBC режим
//     QCA::Cipher cipher(QString("aes128"), QCA::Cipher::CBC,
//        //использовать отступ по умолчанию который эквивалентен PKCS7 для CBC
//                QCA::Cipher::DefaultPadding,
//                // этот объект будет зашифрован
//                QCA::Decode,
//                _key, _initVector);

//     QCA::SecureArray u = cipher.process(input);
//     if (!cipher.ok())
//     {
//         return res;
//     }
//     res = QString(u.data());
//    }
//    return res;
//}
