TEMPLATE = app
TARGET = 100balls

QT += qml quick

SOURCES += main.cpp

RESOURCES += 100balls.qrc

OTHER_FILES += 100balls.apparmor \
               100balls.desktop \
               100balls.png

#specify where the config files are installed to
config_files.path = /100balls
config_files.files += $${OTHER_FILES}
message($$config_files.files)
INSTALLS+=config_files

# Default rules for deployment.
include(../deployment.pri)

