# Add more folders to ship with the application, here
#folder_01.source = qml/carManager
#folder_01.target = qml
folder_02.source = db
folder_02.target =
DEPLOYMENTFOLDERS = folder_02

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    src/authState.cpp \
    src/auththread.cpp \
    src/encryption.cpp \
    src/sqlservice.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

QT += sql

CONFIG += crypto

RESOURCES += \
    UI.qrc

HEADERS += \
    src/authState.h \
    src/auththread.h \
    src/encryption.h \
    src/sqlservice.h

OTHER_FILES += \
    qml/carManager/components/dropDownList.qml \
    qml/carManager/components/LineInput.qml \
    qml/carManager/components/TextArea.qml \
    qml/carManager/main.qml \
    image/loading.gif \
    image/addProfile.png \
    image/car.png \
    image/lineedit.png \
    image/proccess.png \
    image/wrench.png \
    image/lineedit.sci \
    qml/carManager/windows/regWindow.qml \
    qml/carManager/forms/regForm.qml \
    qml/carManager/forms/infoForm.qml
