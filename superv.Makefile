# Copyright (C) 2021  FREIA Laboratory

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


# The following lines are required
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile

# Most modules only need to be built for x86_64
ARCH_FILTER += linux-x86_64
ARCH_FILTER += linux-x86_64-debug

# If your module has dependencies, you will generate want to include them like
#
#     REQUIRED += asyn
#     ifneq ($(strip $(ASYN_DEP_VERSION)),)
#       asyn_VERSION=$(ASYN_DEP_VERSION)
#     endif
# 
# with $(ASYN_DEP_VERSION) defined in `configure/CONFIG_MODULE`


# Since this file (superv.Makefile) is copied into
# the module directory at build-time, these paths have to be relative
# to that path
APP := .
APPDB := $(APP)/Db
APPSRC := $(APP)/src

# If you have files to include, you will generally want to include these, e.g.
#
#     SOURCES += $(APPSRC)/supervMain.cpp
#     SOURCES += $(APPSRC)/library.c
#     HEADERS += $(APPSRC)/library.h
#     USR_INCLUDES += -I$(where_am_I)$(APPSRC)

SOURCES += $(APPSRC)/getEpochTime.c

TEMPLATES += $(wildcard $(APPDB)/*.db)
TEMPLATES += $(wildcard $(APPDB)/*.proto)
TEMPLATES += $(wildcard $(APPDB)/*.template)

DBDS += $(wildcard $(APPDB)/*.dbd)

SCRIPTS += $(wildcard ../iocsh/*.iocsh)
SCRIPTS += $(wildcard ../iocsh/*.iocsh)
SCRIPTS += ../tools/tomcatMon/TomcatMonitor.py
SCRIPTS += ../tools/arcaplMon/ArcaplMonitor.py

SUBS = $(wildcard $(APPDB)/*.substitutions)
TMPS = $(wildcard $(APPDB)/*.template)

USR_DBFLAGS += -I . -I ..
USR_DBFLAGS += -I $(EPICS_BASE)/db
USR_DBFLAGS += -I $(APPDB)

.PHONY: vlibs
vlibs:
