https://www.tutu.ru/poezda/order/passengers/?result_id=60e34c70vuetify set element widthTEMPLATE = apphttps://www.tutu.ru/poezda/order/passengers/?result_id=60e34c70

QT += qml quick multimedia
CONFIG += c++14

SOURCES += main.cpp

RESOURCES += qml.qrc

include(/home/prog/tools/qml-box2d/box2d_lib.pri)

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH = e:/tools/Qt/5.10.0/android_armv7/qml/Box2D.2.0
#QML_IMPORT_PATH += e:/tools/Qt/5.10.0/mingw53_32/qml/Box2D.2.0

QML_IMPORT_PATH = /mnt/storage/tools/Qt/5.11.2/android_armv7/qml/Box2D.2.0
#QML_IMPORT_PATH += ~/tools/Qt/5.11.2/mingw53_32/qml/Box2D.2.0

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    qml/global/qmldir

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
