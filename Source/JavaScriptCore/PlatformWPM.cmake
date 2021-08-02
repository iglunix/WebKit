list(APPEND JavaScriptCore_PUBLIC_FRAMEWORK_HEADERS
    API/JSCallbackFunction.h
    API/JSContext.h
    API/JSContextPrivate.h
    API/JSContextRefPrivate.h
    API/JSExport.h
    API/JSManagedValue.h
    API/JSValue.h
    API/JSValuePrivate.h
    API/JSVirtualMachine.h
    API/wpm/JavaScriptCore.h
)
install(FILES ${JavaScriptCore_PUBLIC_FRAMEWORK_HEADERS}
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/JavaScriptCore"
    COMPONENT "Development"
)
