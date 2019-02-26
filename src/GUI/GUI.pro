#
#  $Id$
#
#  This file is part of the Virtual Leaf.
#
#  The Virtual Leaf is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  The Virtual Leaf is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with the Virtual Leaf.  If not, see <http://www.gnu.org/licenses/>.
#
#  Copyright 2010 Roeland Merks.
#

CONFIG -= release
CONFIG += debug
CONFIG += qt
CONFIG+=sdk_no_version_check


VLEAFLIBDIR = ../Library
PERLDIR = ../Perl

QT += widgets
QT += printsupport

INCLUDEPATH += ../Library

#REACTIONS = reactions_auxin_growth.h 
#REACTIONS = reactions_meinhardt.h
#REACTIONS = reactions_pce_growth.h
DEFINES += QTGRAPHICS
DEFINES += REACTIONS_HEADER=$${REACTIONS}
DEFINES += REACTIONS_HEADER_STRING=\"$${REACTIONS}\"
DEFINES += FLEMING

BINDIR = ../../bin
LIBDIR = ../../lib
DESTDIR = $$BINDIR
TARGET = VirtualLeaf
TEMPLATE = app
PARTMPL = $${TARGET}par.tmpl
MAINSRC = $${TARGET}.cpp
QT -= network sql xml

LIBS += -L$${LIBDIR}
!win32 {
 GRAPHICS = qt #qwt
}

win32 {
 CONFIG -= console
 CONFIG += windows
 LIBXML2DIR = $${LIBDIR}\libxml2
 LIBICONVDIR = $${LIBDIR}\libiconv
 LIBZDIR = $${LIBDIR}\libz
 GRAPHICS = qt 
 RC_FILE = VirtualLeaf.rc
 QMAKE_CXXFLAGS += -DLIBXML_STATIC
 QMAKE_CXXFLAGS += -I$${LIBXML2DIR}\include -I$${LIBICONVDIR}\include -I$${LIBZDIR}\include
 LIBS += -L$${LIBXML2DIR}\lib -lxml2 -L$${LIBICONVDIR}\lib -liconv -L$${LIBZDIR}\lib -lz -lm -lwsock32
}


macx:release {
 LIBS+= -dead_strip
}

unix {
# CC = /usr/bin/gcc
# # QWTDIR = /ufs/guravage/opt/qwt-5.2.1-svn
# #QMAKE_LIBDIR += $$QWTDIR/lib
QMAKE_CXXFLAGS += -fPIC -I/usr/include/libxml2
# QMAKE_LFLAGS += -fPIC
 LIBS += -lxml2 -lz -lm
}

# Input
# apoplastitem.h
HEADERS += \
 canvas.h \
$${VLEAFLIBDIR}/cellbase.h \
 cell.h \
 cellitem.h \
 forwardeuler.h \
 hull.h \
 infobar.h \
 mainbase.h \
 mainbase.h \
 $${VLEAFLIBDIR}/matrix.h \
 mesh.h \
 modelcatalogue.h \
 Neighbor.h \
 node.h \
 nodeitem.h \
 nodeset.h \
 OptionFileDialog.h \
 $${VLEAFLIBDIR}/output.h \
 $${VLEAFLIBDIR}/parameter.h \
 $${VLEAFLIBDIR}/parse.h \
 pi.h \
 qcanvasarrow.h \
 $${VLEAFLIBDIR}/random.h \
 rungekutta.h \
 simitembase.h \
 $${VLEAFLIBDIR}/simplugin.h \
 sqr.h \
 tiny.h \
 transporterdialog.h \
 $${VLEAFLIBDIR}/UniqueMessage.h \
 $${VLEAFLIBDIR}/vector.h \
 $${VLEAFLIBDIR}/wallbase.h \
 wall.h \
 wallitem.h \
 $${VLEAFLIBDIR}/warning.h \
 xmlwrite.h \
 $${VLEAFLIBDIR}/$${PARTMPL}

# apoplastitem.cpp
SOURCES += \
 canvas.cpp \
 cell.cpp \
$${VLEAFLIBDIR}/cellbase.cpp \
 cellitem.cpp \
 forwardeuler.cpp \
 hull.cpp \
 $${VLEAFLIBDIR}/matrix.cpp \
 mainbase.cpp \
 mesh.cpp \
 modelcatalogue.cpp \
 Neighbor.cpp \
 node.cpp \
 nodeitem.cpp \
 nodeset.cpp \
 $${VLEAFLIBDIR}/output.cpp \
 OptionFileDialog.cpp \
 $${VLEAFLIBDIR}/parameter.cpp \
 $${VLEAFLIBDIR}/parse.cpp \
$${VLEAFLIBDIR}/random.cpp \
 rungekutta.cpp \
 simitembase.cpp \
 transporterdialog.cpp \
$${VLEAFLIBDIR}/UniqueMessage.cpp \
$${VLEAFLIBDIR}/vector.cpp \
 wall.cpp \
$${VLEAFLIBDIR}/wallbase.cpp \
 wallitem.cpp \
$${VLEAFLIBDIR}/warning.cpp \
 xmlwrite.cpp \
 $$MAINSRC

contains( TARGET, leaf_fleming ) {
 DEFINES += FLEMING	
}

# Create pardialog.cpp from *.tmpl file
TMPL_FILES = $${VLEAFLIBDIR}/$${PARTMPL}
tmpl_compiler.output = pardialog.cpp
tmpl_compiler.commands = perl $${PERLDIR}/make_pardialog_source.pl ${QMAKE_FILE_NAME}
tmpl_compiler.input = TMPL_FILES
tmpl_compiler.variable_out = SOURCES
tmpl_compiler.clean = 
QMAKE_EXTRA_COMPILERS += tmpl_compiler

# Create pardialog.h from *.tmpl file
tmplh_compiler.output = pardialog.h
tmplh_compiler.commands = perl $${PERLDIR}/make_pardialog_source.pl ${QMAKE_FILE_NAME}
tmplh_compiler.input = TMPL_FILES
tmplh_compiler.variable_out = HEADERS
tmplh_compiler.config += moc_verify
# tmplh_compiler.clean = 
QMAKE_EXTRA_COMPILERS += tmplh_compiler

# See https://forum.qt.io/topic/64160/qmake_extra_compilers-and-moc/2
PARDIALOG_H = pardialog.h
new_moc.commands = moc $(DEFINES) $(INCPATH) canbus.h -o ${QMAKE_FILE_OUT}
new_moc.input = "PARDIALOG_H"
new_moc.output = moc_pardialog.cpp
new_moc.variable_out = SOURCES
QMAKE_EXTRA_COMPILERS += new_moc

contains(GRAPHICS, qwt) {
 #macx:LIBS += -L$$QWTDIR/lib -lqwt
 #win32:LIBS += -L$$QWTDIR/lib -lqwt5
 #LIBS += -L$$QWTDIR/lib -lqwt
 INCLUDEPATH += $$QWTDIR/include
 DEFINES += HAVE_QWT
 HEADERS += data_plot.h
 SOURCES += data_plot.cpp
}

contains( GRAPHICS, qt ) {
 message( "Building Qt executable" )
 QMAKE_CXXFLAGS += -DQTGRAPHICS # -fpermissive
}



# MACOSX packaging
macx {
ICON = leaficon.icns
QMAKE_POST_LINK = "cp leaficon.icns $${DESTDIR}/$${TARGET}.app; \ 
      cp ../../doc/gpl3.txt $${DESTDIR}/$${TARGET}.app/Contents/MacOS/.;" 
}


