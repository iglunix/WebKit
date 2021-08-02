include(Headers.cmake)

add_definitions(-DBUILDING_WEBKIT)
add_definitions(-DBUILDING_WEBKIT2)

set(WebKit_USE_PREFIX_HEADER ON)

list(APPEND WebProcess_SOURCES
    WebProcess/EntryPoint/unix/WebProcessMain.cpp
)

list(APPEND WebProcess_PRIVATE_LIBRARIES
    ${EGL_LIBRARIES}
    OpenSSL::Crypto
)

list(APPEND NetworkProcess_SOURCES
    NetworkProcess/EntryPoint/unix/NetworkProcessMain.cpp
)

list(APPEND NetworkProcess_PRIVATE_LIBRARIES
    OpenSSL::Crypto
)

list(APPEND GPUProcess_SOURCES
    GPUProcess/EntryPoint/unix/GPUProcessMain.cpp
)

list(APPEND GPUProcess_PRIVATE_LIBRARIES
    ${EGL_LIBRARIES}
)

list(APPEND WebKit_SOURCES

    WebProcess/playstation/WebProcessMainPlayStation.cpp
    NetworkProcess/Classifier/WebResourceLoadStatisticsStore.cpp

    NetworkProcess/Cookies/curl/WebCookieManagerCurl.cpp

    NetworkProcess/WebStorage/StorageManager.cpp

    NetworkProcess/cache/NetworkCacheDataCurl.cpp
    NetworkProcess/cache/NetworkCacheIOChannelCurl.cpp

    NetworkProcess/curl/NetworkDataTaskCurl.cpp
    NetworkProcess/curl/NetworkProcessCurl.cpp
    NetworkProcess/curl/NetworkProcessMainCurl.cpp
    NetworkProcess/curl/NetworkSessionCurl.cpp
    NetworkProcess/curl/RemoteNetworkingContextCurl.cpp

    Platform/IPC/unix/AttachmentUnix.cpp
    Platform/IPC/unix/ConnectionUnix.cpp

    Platform/classifier/ResourceLoadStatisticsClassifier.cpp

    Platform/unix/LoggingUnix.cpp
    Platform/unix/ModuleUnix.cpp
    Platform/unix/SharedMemoryUnix.cpp

    Shared/unix/AuxiliaryProcessMain.cpp

    Platform/IPC/unix/AttachmentUnix.cpp
    Platform/IPC/unix/ConnectionUnix.cpp

    WebProcess/WebCoreSupport/curl/WebFrameNetworkingContext.cpp

    WebProcess/playstation/WebProcessPlayStation.cpp

    Shared/curl/WebCoreArgumentCodersCurl.cpp
    Shared/cairo/ShareableBitmapCairo.cpp

    UIProcess/wpm/WebPageProxyWPM.cpp

    UIProcess/Automation/cairo/WebAutomationSessionCairo.cpp

    UIProcess/LegacySessionStateCodingNone.cpp

    UIProcess/WebsiteData/playstation/WebsiteDataStorePlayStation.cpp

    UIProcess/Launcher/posix/ProcessLauncherPOSIX.cpp

    UIProcess/WebsiteData/curl/WebsiteDataStoreCurl.cpp

    UIProcess/wpm/WebProcessPoolWPM.cpp

    WebProcess/InjectedBundle/wpm/InjectedBundleWPM.cpp

    Shared/playstation/WebCoreArgumentCodersPlayStation.cpp


    UIProcess/linux/MemoryPressureMonitor.cpp

    WebProcess/WebPage/playstation/WebPagePlayStation.cpp

    Shared/libwpe/NativeWebKeyboardEventLibWPE.cpp
    Shared/libwpe/NativeWebMouseEventLibWPE.cpp
    Shared/libwpe/NativeWebTouchEventLibWPE.cpp
    Shared/libwpe/NativeWebWheelEventLibWPE.cpp
    Shared/libwpe/WebEventFactory.cpp

    WebProcess/WebPage/AcceleratedSurface.cpp
    WebProcess/WebPage/libwpe/AcceleratedSurfaceLibWPE.cpp
    UIProcess/libwpe/WebPasteboardProxyLibWPE.cpp

    WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
    WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
    WebProcess/WebPage/CoordinatedGraphics/CompositingCoordinator.cpp
    Shared/CoordinatedGraphics/SimpleViewportController.cpp

    Shared/CoordinatedGraphics/CoordinatedGraphicsScene.cpp
    Shared/CoordinatedGraphics/threadedcompositor/CompositingRunLoop.cpp
    Shared/CoordinatedGraphics/threadedcompositor/ThreadedCompositor.cpp
    Shared/CoordinatedGraphics/threadedcompositor/ThreadedDisplayRefreshMonitor.cpp


    Shared/API/c/cairo/WKImageCairo.cpp

    Shared/API/c/curl/WKCertificateInfoCurl.cpp

    Shared/API/c/playstation/WKEventPlayStation.cpp

    UIProcess/API/C/WKViewportAttributes.cpp

    UIProcess/API/C/curl/WKProtectionSpaceCurl.cpp
    UIProcess/API/C/curl/WKWebsiteDataStoreRefCurl.cpp
    UIProcess/API/C/playstation/WKView.cpp


)

    # UIProcess/API/C/playstation/WKContextConfigurationPlayStation.cpp
    # UIProcess/API/C/playstation/WKPagePrivatePlayStation.cpp
    # UIProcess/API/C/playstation/WKRunLoop.cpp

#    Shared/libwpe/NativeWebKeyboardEventLibWPE.cpp
#    Shared/libwpe/NativeWebMouseEventLibWPE.cpp
#    Shared/libwpe/NativeWebTouchEventLibWPE.cpp
#    Shared/libwpe/NativeWebWheelEventLibWPE.cpp
#    Shared/libwpe/WebEventFactory.cpp




# list(APPEND WebKit_INCLUDE_DIRECTORIES
#     "${WEBKIT_DIR}/NetworkProcess/curl"
#     "${WEBKIT_DIR}/Shared/glfw"
#     "${WEBKIT_DIR}/Platform/IPC/unix"
#     "${WEBKIT_DIR}/WebProcess/WebCoreSupport/curl"
#     "${WEBKIT_DIR}/Platform/classifier"
#     "${WEBKIT_DIR}/UIProcess/linux/"
# )

list(APPEND WebKit_INCLUDE_DIRECTORIES
    "${WEBKIT_DIR}/NetworkProcess/curl"
    "${WEBKIT_DIR}/Platform/IPC/unix"
    "${WEBKIT_DIR}/Platform/classifier"
    "${WEBKIT_DIR}/Platform/generic"
    "${WEBKIT_DIR}/Shared/CoordinatedGraphics"
    "${WEBKIT_DIR}/Shared/CoordinatedGraphics/threadedcompositor"
    "${WEBKIT_DIR}/Shared/libwpe"
    "${WEBKIT_DIR}/Shared/API/c/playstation"
    "${WEBKIT_DIR}/UIProcess/API/C/cairo"
    "${WEBKIT_DIR}/UIProcess/API/C/curl"
    "${WEBKIT_DIR}/UIProcess/API/C/playstation"
    "${WEBKIT_DIR}/UIProcess/API/playstation"
    "${WEBKIT_DIR}/UIProcess/playstation"
    "${WEBKIT_DIR}/UIProcess/CoordinatedGraphics"
    "${WEBKIT_DIR}/UIProcess/linux/"
    "${WEBKIT_DIR}/WebProcess/WebCoreSupport/curl"
    "${WEBKIT_DIR}/WebProcess/WebPage/CoordinatedGraphics"
    "${WEBKIT_DIR}/WebProcess/WebPage/libwpe"
)


    # IMPLEMENT
    # "${WEBKIT_DIR}/UIProcess/API/C/playstation"
    # "${WEBKIT_DIR}/UIProcess/API/playstation"


list(APPEND WebKit_PUBLIC_FRAMEWORK_HEADERS
    Shared/API/c/cairo/WKImageCairo.h

    Shared/API/c/curl/WKCertificateInfoCurl.h

    UIProcess/API/C/curl/WKProtectionSpaceCurl.h
    UIProcess/API/C/curl/WKWebsiteDataStoreRefCurl.h

    Shared/API/c/wpm/WebKit.h
    Shared/API/c/wpm/WKBaseWPM.h
    UIProcess/API/C/playstation/WKView.h
    UIProcess/API/C/playstation/WKViewClient.h
)

install(FILES ${WebKit_PUBLIC_FRAMEWORK_HEADERS}
	DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/WebKit"
	COMPONENT "Development"
)


    # UIProcess/API/C/playstation/WKContextConfigurationPlayStation.h
    # Shared/API/c/playstation/WKEventPlayStation.h
    # UIProcess/API/C/playstation/WKPagePrivatePlayStation.h
    # UIProcess/API/C/playstation/WKRunLoop.h






    # UIProcess/API/C/playstation/WKView.h
    # UIProcess/API/C/playstation/WKViewClient.h
