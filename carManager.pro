# Add more folders to ship with the application, here
folder_01.source = qml/carManager
folder_01.target = qml
folder_02.source = resources/db
folder_02.target = resources
DEPLOYMENTFOLDERS = folder_01 folder_02

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

OTHER_FILES += \
    qml/dropDownList.qml \
    qml/main.qml \
    isValidUser.sql \
    resources/image/lineedit.png \
    resources/image/lineedit.sci \
    regForm.qml

RESOURCES += \
    UI.qrc \
    SQL.qrc

HEADERS += \
    encryption.h \
    sqlservice.h \
    authState.h \
    authThread.h
