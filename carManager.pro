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
    encryption.cpp \
    sqlservice.cpp \
    authState.cpp \
    authThread.cpp

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
    encryption.h \
    sqlservice.h \
    authState.h \
    authThread.h

OTHER_FILES += \
    qml/carManager/dropDownList.qml \
    qml/carManager/LineInput.qml \
    qml/carManager/main.qml \
    qml/carManager/TextArea.qml \
    image/loading.gif \
    image/addProfile.png \
    image/car.png \
    image/lineedit.png \
    image/proccess.png \
    image/wrench.png \
    image/lineedit.sci \
    qml/carManager/regWindow.qml \
    qml/carManager/regForm.qml \
    qml/carManager/infoForm.qml
