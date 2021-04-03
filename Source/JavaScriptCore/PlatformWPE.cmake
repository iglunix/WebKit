include(inspector/remote/Socket.cmake)

list(APPEND JavaScriptCore_LIBRARIES)

list(APPEND JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES)

install(FILES ${JavaScriptCore_INSTALLED_HEADERS}
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/wpe-webkit-${WPE_API_VERSION}/jsc"
    COMPONENT "Development"
)

add_definitions(-DJSC_COMPILATION)
#add_definitions(-DPKGLIBDIR="${CMAKE_INSTALL_FULL_LIBDIR}/wpe-webkit-${WPE_API_VERSION}")
