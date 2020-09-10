# SPDX-License-Identifier: BSD-3-Clause
# Copyright Contributors to the OpenEXR Project.

file(READ configure.ac CONFIGURE_AC_CONTENTS)
string(REGEX MATCH "AC_INIT\\(OpenEXR_Viewers,[ ]*([0-9]+).([0-9]+).([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(OPENEXR_VIEWERS_VERSION_MAJOR ${CMAKE_MATCH_1})
set(OPENEXR_VIEWERS_VERSION_MINOR ${CMAKE_MATCH_2})
set(OPENEXR_VIEWERS_VERSION_PATCH ${CMAKE_MATCH_3})
set(OPENEXR_VIEWERS_VERSION       ${OPENEXR_VIEWERS_VERSION_MAJOR}.${OPENEXR_VIEWERS_VERSION_MINOR}.${OPENEXR_VIEWERS_VERSION_PATCH})
set(OPENEXR_VIEWERS_VERSION_API   ${OPENEXR_VIEWERS_VERSION_MAJOR}_${OPENEXR_VIEWERS_VERSION_MINOR})
string(REGEX MATCH "LIBTOOL_CURRENT=([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(OPENEXR_VIEWERS_SOCURRENT ${CMAKE_MATCH_1})
string(REGEX MATCH "LIBTOOL_REVISION=([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(OPENEXR_VIEWERS_SOREVISION ${CMAKE_MATCH_1})
string(REGEX MATCH "LIBTOOL_AGE=([0-9]+)" DUMMY ${CONFIGURE_AC_CONTENTS})
set(OPENEXR_VIEWERS_SOAGE ${CMAKE_MATCH_1})
math(EXPR OPENEXR_VIEWERS_SOVERSION "${OPENEXR_VIEWERS_SOCURRENT} - ${OPENEXR_VIEWERS_SOAGE}")
set(OPENEXR_VIEWERS_LIB_VERSION "${OPENEXR_VIEWERS_SOVERSION}.${OPENEXR_VIEWERS_SOAGE}.${OPENEXR_VIEWERS_SOREVISION}")
message(STATUS "Configure OpenEXR Viewers Version: ${OPENEXR_VIEWERS_VERSION} Lib API: ${OPENEXR_VIEWERS_LIB_VERSION}")
unset(CONFIGURE_AC_CONTENTS)
