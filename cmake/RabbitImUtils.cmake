MACRO(INSTALL_QT_LIBRARY _NAME)
  IF(WIN32)
    SET(_PREFIX "Qt5")
    SET(_EXT "dll")
  ELSE(WIN32)
    SET(_PREFIX "libQt5")
    SET(_EXT "so")
  ENDIF(WIN32)
  SET(_LIB "${QT_INSTALL_DIR}/bin/${_PREFIX}${_NAME}.${_EXT}")
  IF(EXISTS ${_LIB})
    INSTALL(FILES ${_LIB} DESTINATION ${CMAKE_INSTALL_PREFIX})
  ENDIF(EXISTS ${_LIB})
ENDMACRO(INSTALL_QT_LIBRARY)

MACRO(INSTALL_QT_PLUGINS _PLUGINS_PARA)
    FOREACH(_plugins ${ARGV})
        SET(_plugins ${_plugins})
        FOREACH(_plugin ${${_plugins}})
            get_target_property(_plugin_file ${_plugin} LOCATION)
            if(_plugin_file)
                STRING(REGEX REPLACE "^.*(plugins.*)/.*$" "\\1" _des_plugin_file ${_plugin_file})
                INSTALL(FILES ${_plugin_file} DESTINATION "${CMAKE_INSTALL_PREFIX}/${_des_plugin_file}")
            endif()
        ENDFOREACH()
    ENDFOREACH()
ENDMACRO(INSTALL_QT_PLUGINS)

MACRO(INSTALL_QT_LIBRARYS _LIBS)
    foreach(_file  ${ARGV})
        get_target_property(_location ${_file} LOCATION)
        IF(EXISTS ${_location})
            INSTALL(FILES ${_location} DESTINATION ${CMAKE_INSTALL_PREFIX})
        ENDIF(EXISTS ${_location})
    endforeach()
ENDMACRO(INSTALL_QT_LIBRARYS)