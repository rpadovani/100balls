qt_install_libs = $$[QT_INSTALL_LIBS]
target.path = /lib/$$basename(qt_install_libs)/bin
export(target.path)
INSTALLS += target

lib_copy.path = /lib/$$basename(qt_install_libs)/Bacon2D
lib_copy.files = /usr/lib/$$basename(qt_install_libs)/qt5/qml/Bacon2D.1.0/*
INSTALLS += lib_copy

