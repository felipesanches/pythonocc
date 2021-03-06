##Copyright (c) 2011 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU General Public License for more details.
##
##You should have received a copy of the GNU General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

# pythonOCC cmake build file
SET(PROJECT_NAME pythonOCC)
PROJECT(${PROJECT_NAME})

# set pythonOCC version
SET(${PROJECT_NAME}_VERSION_MAJOR 0)
SET(${PROJECT_NAME}_VERSION_MINOR 6dev)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

SET(CMAKE_BUILD_TYPE "MinSizeRel" CACHE STRING "Build type")
MESSAGE(STATUS " ${CMAKE_CXX_FLAGS}") 
SET(BUILD_SHARED_LIBS ON)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

#############################
# Option_With_Default macro #
#############################
MACRO( OPTION_WITH_DEFAULT OPTION_NAME OPTION_STRING OPTION_DEFAULT )
IF( NOT DEFINED ${OPTION_NAME} )
	SET( ${OPTION_NAME} ${OPTION_DEFAULT} )
ENDIF( NOT DEFINED ${OPTION_NAME} )
	OPTION( ${OPTION_NAME} "${OPTION_STRING}" ${${OPTION_NAME}} )
ENDMACRO( OPTION_WITH_DEFAULT OPTION_NAME OPTION_STRING OPTION_DEFAULT )

##################################
# Set/Check GEOM and SMESH paths #
##################################
SET(GEOM_INCLUDE_PATH /usr/local/include/geom CACHE PATH "geom include path" )
SET(GEOM_LIB_PATH /usr/local/lib CACHE PATH "geom library path" )
SET(SMESH_INCLUDE_PATH /usr/local/include/smesh CACHE PATH "smesh include path" )
SET(SMESH_LIB_PATH /usr/local/lib CACHE PATH "smesh library path" )

FIND_FILE(GEOM_hxx "BlockFix.hxx" PATHS ${GEOM_INCLUDE_PATH})
IF(NOT GEOM_hxx)
    MESSAGE(WARNING "Unable to find GEOM header files. You won't benefit from the GEOM wrapper.")
ENDIF(NOT GEOM_hxx)

FIND_FILE(SMESH_hxx "SMESH_Mesh.hxx" PATHS ${SMESH_INCLUDE_PATH})
IF(NOT SMESH_hxx)
    MESSAGE(WARNING "Unable to find SMESH header files. You won't benefit from the SMESH wrapper.")
ENDIF(NOT SMESH_hxx)

###################
# General options #
###################
# By default, GEOM and SMESH wrappers are disabled
IF(GEOM_hxx)
    OPTION_WITH_DEFAULT(${PROJECT_NAME}_WRAP_GEOM "Wraps the salomegeometry library (enabling parametric modeling)" OFF)
ENDIF(GEOM_hxx)
IF(SMESH_hxx)
    OPTION_WITH_DEFAULT(${PROJECT_NAME}_WRAP_SMESH "Wraps the salomesmesh library (enabling advanced meshing features" OFF)
ENDIF(SMESH_hxx)

#
# Add geom and smesh paths to the list of include directories
# If not, enabling/disabling GEOM causes the whole pythonocc
# to be rebuilt
#
INCLUDE_DIRECTORIES(${GEOM_INCLUDE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/src/wrapper/geom/inc_pythonocc)
INCLUDE_DIRECTORIES(${SMESH_INCLUDE_PATH})

###############################################
# Boost headers are required to compile smesh #
###############################################
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/src/contrib)

##########
# Python #
##########
FIND_PACKAGE(PythonLibs)
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})

##############################################################
# 32/64 bit detection
###############################################################
IF (${CMAKE_SIZEOF_VOID_P} MATCHES "8")
	# If in 64bit mode, we have to define the _OCC64 variable
	ADD_DEFINITIONS(-D_OCC64)
	SET(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -D_OCC64)
ENDIF(${CMAKE_SIZEOF_VOID_P} MATCHES "8")

########
# SWIG #
########
FIND_PACKAGE(SWIG)
INCLUDE(${SWIG_USE_FILE})

########################################
# OpenCASCADE include and lib location #
########################################
# Find OpenCASCADE library, set include and lib path
IF(UNIX)
    FIND_PACKAGE(OCE)
    IF(OCE_FOUND)
        MESSAGE(STATUS "Found OCE version ${OCE_VERSION}")
        # check OCE version =0.8.0
        IF (NOT ${OCE_VERSION} MATCHES "0.8.0")
            MESSAGE(FATAL_ERROR "OCE-0.8.0 is required.")
        ENDIF(NOT ${OCE_VERSION} MATCHES "0.8.0")
        SET(OCE_INCLUDE_PATH ${OCE_INCLUDE_DIRS})
    ELSE(OCE_FOUND)
        SET(OCE_INCLUDE_PATH "UNDEFINED" CACHE PATH "OCE include path" )
        SET(OCE_LIB_PATH "UNDEFINED" CACHE PATH "OCE lib path" )
    ENDIF(OCE_FOUND)
ELSE(UNIX)
SET(OCE_INCLUDE_PATH "UNDEFINED" CACHE PATH "OCE include path" )
SET(OCE_LIB_PATH "UNDEFINED" CACHE PATH "OCE lib path" )
ENDIF(UNIX)

##############################################
# Installation directory                     #
# by default, installed to site-packages/OCC #
##############################################
EXECUTE_PROCESS(COMMAND python -c "from distutils.sysconfig import get_python_lib; import os;print get_python_lib()" OUTPUT_VARIABLE python_lib OUTPUT_STRIP_TRAILING_WHITESPACE )
SET(${PROJECT_NAME}_INSTALL_DIRECTORY ${python_lib}/OCC CACHE PATH "pythonOCC install directory" )

# List of OpenCASCADE shared libraries to link with
SET(OCC_LIBRARIES PTKernel
                  TKAdvTools TKBin TKBinL TKBinTObj TKBinXCAF
                  TKBO TKBool TKBRep TKCAF TKCDF
                  TKernel
                  TKFeat TKFillet TKG2d TKG3d TKGeomAlgo TKGeomBase TKHLR
                  TKIGES TKLCAF TKMath TKMesh TKMeshVS TKNIS TKOffset
                  TKOpenGl TKPCAF TKPLCAF TKPrim TKPShape TKService TKShapeSchema
                  TKShHealing TKStdLSchema TKStdSchema TKSTEP TKSTEP209 TKSTEPAttr
                  TKSTEPBase TKSTL TKTObj TKTopAlgo
                  TKV2d TKV3d TKVRML TKXCAF TKXCAFSchema
                  TKXDEIGES TKXDESTEP TKXMesh TKXml TKXmlL TKXmlTObj
                  TKXmlXCAF TKXSBase TKVoxel)

# Tells CMake where are the required headers
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})
INCLUDE_DIRECTORIES(${OCE_INCLUDE_PATH})
LINK_DIRECTORIES(${OCE_LIB_PATH})

##############
# salomegeom #
##############
IF(${PROJECT_NAME}_WRAP_GEOM)
	SET(GEOM_LIBRARIES Archimede Exchange3DS ExchangeBREP ExchangeCSFDB
		ExchangeIGES ExchangeOBJ ExchangeSTEP ExchangeSTL ExchangeVRML
		GEOM GEOMAlgo GEOMImpl NMTDS NMTTools Partition
		ShHealOper Sketcher)
	LINK_DIRECTORIES(${GEOM_LIB_PATH})
ENDIF(${PROJECT_NAME}_WRAP_GEOM)

##############
# salomesmesh #
##############
IF(${PROJECT_NAME}_WRAP_SMESH)
	SET(SMESH_LIBRARIES SMDS SMESHDS SMESH StdMeshers DriverDAT DriverSTL DriverUNV)
	LINK_DIRECTORIES(${SMESH_LIB_PATH})
ENDIF(${PROJECT_NAME}_WRAP_SMESH)

######################################################
# Configure Build settings according to the platform #
######################################################
IF(UNIX)
  IF(APPLE)
    ######### MacOSX ###########
    MESSAGE(STATUS " -- MacOSX system detected")
	INCLUDE_DIRECTORIES(/usr/X11R6/include)
    ADD_DEFINITIONS(-DHAVE_CONFIG_H -DHAVE_LIMITS_H -DCSFDB -DLIN -DOCC_CONVERT_SIGNALS)
    SET(CMAKE_SWIG_FLAGS -O -w302,401,314,509,512
		-DCSFDB -DHAVE_CONFIG_H -DHAVE_LIMITS_H -DOCC_CONVERT_SIGNALS)
    SET(SWIG_FILES_PATH src/wrapper/SWIG_files/linux_darwin)
  ELSE(APPLE)
    ######### Unix/Linux ###########
    MESSAGE(STATUS " -- Unix/Linux system detected")
    ADD_DEFINITIONS(-DHAVE_CONFIG_H -DHAVE_LIMITS_H -DCSFDB -DLIN -DOCC_CONVERT_SIGNALS)
    SET(CMAKE_SWIG_FLAGS -O -w302,401,314,509,512
		-DCSFDB -DHAVE_CONFIG_H -DHAVE_LIMITS_H -DOCC_CONVERT_SIGNALS -DLIN -DLIN_INTEL -D_GNU_SOURCE=1)
    SET(SWIG_FILES_PATH src/wrapper/SWIG_files/linux_darwin)
  ENDIF(APPLE)
ELSE(UNIX)
  IF(WIN32)
    ######### Windows ###########
    MESSAGE(STATUS " -- Windows system detected")
    ADD_DEFINITIONS(-DWNT -DWIN32 -D_WINDOWS -DCSFDB)
	# specific windows defines for python version >=2.6.0
	EXECUTE_PROCESS(COMMAND python -c "import sys;print (2,6)>=sys.version_info[:2]" OUTPUT_VARIABLE PYTHON_26_OR_HIGHER OUTPUT_STRIP_TRAILING_WHITESPACE)
	IF(${PYTHON_26_OR_HIGHER} MATCHES "True")
	  ADD_DEFINITIONS(-DHAVE_ACOSH -DHAVE_ASINH -DHAVE_ATANH)
	ENDIF(${PYTHON_26_OR_HIGHER} MATCHES "True")
    SET(CMAKE_SWIG_FLAGS -O -w302,401,314,509,512
		-DCSFDB -DWIN32 -D_WINDOWS)
    SET(SWIG_FILES_PATH src/wrapper/SWIG_files/win32)
  ELSE(WIN32)
    MESSAGE(STATUS " Unknown platform")
  ENDIF(WIN32)
ENDIF(UNIX)

############################
# OpenCASCADE Modules list #
############################
IF(WIN32)
  INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OCE_Modules_Win.cmake)
ELSE(WIN32)
  INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OCE_Modules_Unix.cmake)
ENDIF(WIN32)
# add an option to choose modules to compile
FOREACH(OCC_MODULE ${OCC_MODULES})
	OPTION_WITH_DEFAULT(OCCMODULES_WRAP_${OCC_MODULE} "Compile ${OCC_MODULE}" TRUE)
ENDFOREACH(OCC_MODULE ${OCC_MODULES})

###############################
# salomegeometry Modules list #
###############################
IF(${PROJECT_NAME}_WRAP_GEOM)
	INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/cmake/GEOM_Modules.cmake)
	FOREACH(GEOM_MODULE ${GEOM_MODULES})
		OPTION_WITH_DEFAULT(GEOMMODULES_WRAP_${GEOM_MODULE} "Compile ${GEOM_MODULE}" TRUE)
	ENDFOREACH(GEOM_MODULE ${GEOM_MODULES})
ENDIF(${PROJECT_NAME}_WRAP_GEOM)

############################
# salomesmesh Modules list #
############################
IF(${PROJECT_NAME}_WRAP_SMESH)
	INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/cmake/SMESH_Modules.cmake)
	FOREACH(SMESH_MODULE ${SMESH_MODULES})
		OPTION_WITH_DEFAULT(SMESHMODULES_WRAP_${SMESH_MODULE} "Compile ${SMESH_MODULE}" TRUE)
	ENDFOREACH(SMESH_MODULE ${SMESH_MODULES})
ENDIF(${PROJECT_NAME}_WRAP_SMESH)

###################
# Wrapper Modules #
###################

# OpenCASCADE
FILE(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/${SWIG_FILES_PATH})
FOREACH(OCC_MODULE ${OCC_MODULES})
	IF(OCCMODULES_WRAP_${OCC_MODULE})
    	SET(FILE ${SWIG_FILES_PATH}/${OCC_MODULE}.i)
		SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
    	SWIG_ADD_MODULE(${OCC_MODULE} python ${FILE})
    	SWIG_LINK_LIBRARIES(${OCC_MODULE} ${PYTHON_LIBRARIES} ${OCC_LIBRARIES})
	ENDIF(OCCMODULES_WRAP_${OCC_MODULE})
ENDFOREACH(OCC_MODULE)

# salomegeometry
IF(${PROJECT_NAME}_WRAP_GEOM)
	FOREACH(GEOM_MODULE ${GEOM_MODULES})
		IF(GEOMMODULES_WRAP_${GEOM_MODULE})
	    	SET(FILE ${SWIG_FILES_PATH}/${GEOM_MODULE}.i)
			SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
	    	SWIG_ADD_MODULE(${GEOM_MODULE} python ${FILE})
	    	SWIG_LINK_LIBRARIES(${GEOM_MODULE} ${PYTHON_LIBRARIES} ${OCC_LIBRARIES} ${GEOM_LIBRARIES})
		ENDIF(GEOMMODULES_WRAP_${GEOM_MODULE})
	ENDFOREACH(GEOM_MODULE)
ENDIF(${PROJECT_NAME}_WRAP_GEOM)

# salomesmesh
IF(${PROJECT_NAME}_WRAP_SMESH)
	FOREACH(SMESH_MODULE ${SMESH_MODULES})
	  IF(SMESHMODULES_WRAP_${SMESH_MODULE})
	    SET(FILE ${SWIG_FILES_PATH}/${SMESH_MODULE}.i)
		SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
	    SWIG_ADD_MODULE(${SMESH_MODULE} python ${FILE})
	    SWIG_LINK_LIBRARIES(${SMESH_MODULE} ${PYTHON_LIBRARIES} ${OCC_LIBRARIES} ${SMESH_LIBRARIES})
      ENDIF(SMESHMODULES_WRAP_${SMESH_MODULE})
    ENDFOREACH(SMESH_MODULE)
ENDIF(${PROJECT_NAME}_WRAP_SMESH)

# Build third part modules
# TODO : the following line is strange but necessary
EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E make_directory src/wrapper/Visualization)
SET_SOURCE_FILES_PROPERTIES(src/wrapper/Visualization/Visualization.i PROPERTIES CPLUSPLUS ON)
INCLUDE_DIRECTORIES(src/wrapper/Visualization)
SET(VISUALIZATION_SOURCE_FILES
	src/wrapper/Visualization/Visualization.i
	src/wrapper/Visualization/Display3d.cpp
	src/wrapper/Visualization/Display2d.cpp
	src/wrapper/Visualization/NISDisplay3d.cpp
	src/wrapper/Visualization/Tesselator.cpp
	)
SWIG_ADD_MODULE(Visualization python ${VISUALIZATION_SOURCE_FILES})
SWIG_LINK_LIBRARIES(Visualization ${PYTHON_LIBRARIES} ${OCC_LIBRARIES})

###########################
# create __init__.py file #
###########################

################
# Installation #
################
IF(WIN32)
	SET(EXTENSION "pyd")
ELSE(WIN32)
	SET(EXTENSION "so")
ENDIF(WIN32)

# install pyOCC modules
FOREACH(OCC_MODULE ${OCC_MODULES})
	IF(OCCMODULES_WRAP_${OCC_MODULE})
		INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/${OCC_MODULE}.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
		INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/_${OCC_MODULE}.${EXTENSION} DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
	ENDIF(OCCMODULES_WRAP_${OCC_MODULE})
ENDFOREACH(OCC_MODULE)

# install pyGEOM modules
IF(${PROJECT_NAME}_WRAP_GEOM)
	FOREACH(GEOM_MODULE ${GEOM_MODULES})
		IF(GEOMMODULES_WRAP_${GEOM_MODULE})
			INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/${GEOM_MODULE}.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
			INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/_${GEOM_MODULE}.${EXTENSION} DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
		ENDIF(GEOMMODULES_WRAP_${GEOM_MODULE})
	ENDFOREACH(GEOM_MODULE)
ENDIF(${PROJECT_NAME}_WRAP_GEOM)

# install pySMESH modules
IF(${PROJECT_NAME}_WRAP_SMESH)
	FOREACH(SMESH_MODULE ${SMESH_MODULES})
		IF(SMESHMODULES_WRAP_${SMESH_MODULE})
			INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/${SMESH_MODULE}.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
			INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/_${SMESH_MODULE}.${EXTENSION} DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
		ENDIF(SMESHMODULES_WRAP_${SMESH_MODULE})
	ENDFOREACH(SMESH_MODULE)
ENDIF(${PROJECT_NAME}_WRAP_SMESH)

# install third part modules
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/Visualization.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/_Visualization.${EXTENSION} DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
# install GC
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/wrapper/GarbageCollector.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
# install addons
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/addons/Display DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/addons/Utils DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/addons/MSH DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/addons/PAF DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/addons/KBE DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/addons/DYN DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
# install background image
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/addons/Display/default_background.bmp DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY}/Display )
# install AUTHORS and LICENSE files
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/AUTHORS DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
# install __init__.py file
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/__init__.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )

#######################
# pythonOCC Packaging #
# $ make package      #
#######################
IF(UNIX)
  INCLUDE(InstallRequiredSystemLibraries)
ENDIF(UNIX)
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "pythonOCC")
SET(CPACK_PACKAGE_VENDOR "Thomas Paviot")
SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE.txt")
SET(CPACK_SET_DESTDIR "ON")
SET(CPACK_PACKAGE_VERSION_MAJOR ${${PROJECT_NAME}_VERSION_MAJOR})
SET(CPACK_PACKAGE_VERSION_MINOR ${${PROJECT_NAME}_VERSION_MINOR})
SET(CPACK_PACKAGE_VERSION_PATCH 0)
SET(CPACK_PACKAGE_NAME ${PROJECT_NAME})
SET(CPACK_PACKAGE_CONTACT "pythonOCC users <pythonocc-users@gna.org")
INCLUDE(CPack)
