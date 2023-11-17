TEMPLATE = app
CONFIG += console c++17
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        ../WorkDir/CException.cxx \
        ../WorkDir/nsSysteme.cxx \
        ../WorkDir/nsUtil.cxx \
        main.cpp

HEADERS += \
    ../Include/CEditable.hpp \
    ../Include/CException.hpp \
    ../Include/CstCodErr.h \
    ../Include/nsSysteme.h \
    ../Include/nsUtil.h
