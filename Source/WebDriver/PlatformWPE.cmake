set(WebDriver_OUTPUT_NAME WPEWebDriver)

list(APPEND WebDriver_SYSTEM_INCLUDE_DIRECTORIES)

list(APPEND WebDriver_SOURCES
    socket/SessionHostSocket.cpp
    glib/WebDriverServiceGLib.cpp

    socket/HTTPServerSocket.cpp

    wpe/WebDriverServiceWPE.cpp
)

list(APPEND WebDriver_LIBRARIES)

list(APPEND WebDriver_FRAMEWORKS
    JavaScriptCore
)
