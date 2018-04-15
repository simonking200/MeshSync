# * MAYA2017_INCLUDE_DIR
# * MAYA2017_LIBRARIES

set(CMAKE_PREFIX_PATH
    "/Applications/Autodesk/maya2017/Maya.app/Contents"
    "/usr/autodesk/maya2017"
    "/opt/autodesk/maya2017"
)

find_path(MAYA2017_INCLUDE_DIR NAMES maya/MGlobal.h)
mark_as_advanced(MAYA2017_INCLUDE_DIR)
foreach(MAYA_LIB OpenMayaAnim OpenMayaFX OpenMayaRender OpenMayaUI OpenMaya Foundation tbb)
    find_library(MAYA2017_${MAYA_LIB}_LIBRARY NAMES ${MAYA_LIB} PATHS ${LIBRARY_PATHS} PATH_SUFFIXES lib MacOS)
    mark_as_advanced(MAYA2017_${MAYA_LIB}_LIBRARY)
    if(MAYA2017_${MAYA_LIB}_LIBRARY)
        list(APPEND MAYA2017_LIBRARIES ${MAYA2017_${MAYA_LIB}_LIBRARY})
    endif()
endforeach()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args("Maya2017"
    DEFAULT_MSG
    MAYA2017_INCLUDE_DIR
    MAYA2017_LIBRARIES
)
