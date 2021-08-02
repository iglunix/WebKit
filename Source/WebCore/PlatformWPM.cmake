
include(platform/FreeType.cmake)
include(platform/Cairo.cmake)
include(platform/Curl.cmake)
include(platform/ImageDecoders.cmake)
include(platform/OpenSSL.cmake)
include(platform/TextureMapper.cmake)

# ${WEBCORE_DIR}/platform/graphics/libwpe
list(APPEND WebCore_PRIVATE_INCLUDE_DIRECTORIES
    ${WEBCORE_DIR}/platform
    ${WEBCORE_DIR}/platform/generic
    ${WEBCORE_DIR}/platform/graphics/egl
    ${WEBCORE_DIR}/platform/graphics/epoxy
    ${WEBCORE_DIR}/platform/graphics/opengl
    ${WEBCORE_DIR}/platform/graphics/libwpe
)

list(APPEND WebCore_SOURCES
    platform/graphics/GLContext.cpp
    platform/graphics/PlatformDisplay.cpp

    platform/graphics/egl/GLContextEGL.cpp
    platform/graphics/egl/GLContextEGLLibWPE.cpp

    platform/graphics/libwpe/PlatformDisplayLibWPE.cpp

    platform/graphics/GLContext.cpp
    platform/graphics/opengl/GraphicsContextGLOpenGLCommon.cpp
    platform/graphics/opengl/GraphicsContextGLOpenGLES.cpp
    platform/graphics/opengl/GraphicsContextGLOpenGLPrivate.cpp
    platform/graphics/opengl/GraphicsContextGLOpenGLBase.cpp

    page/scrolling/nicosia/ScrollingCoordinatorNicosia.cpp
    page/scrolling/nicosia/ScrollingStateNodeNicosia.cpp
    page/scrolling/nicosia/ScrollingTreeFixedNode.cpp
    page/scrolling/nicosia/ScrollingTreeFrameScrollingNodeNicosia.cpp
    page/scrolling/nicosia/ScrollingTreeNicosia.cpp
    page/scrolling/nicosia/ScrollingTreeOverflowScrollProxyNode.cpp
    page/scrolling/nicosia/ScrollingTreeOverflowScrollingNodeNicosia.cpp
    page/scrolling/nicosia/ScrollingTreePositionedNode.cpp
    page/scrolling/nicosia/ScrollingTreeScrollingNodeDelegateNicosia.cpp
    page/scrolling/nicosia/ScrollingTreeStickyNode.cpp

    platform/wpm/UserAgentWPM.cpp

    platform/playstation/MIMETypeRegistryPlayStation.cpp

    platform/generic/KeyedEncoderGeneric.cpp
    platform/generic/KeyedDecoderGeneric.cpp

    platform/network/curl/CurlSSLHandle.cpp
    platform/network/win/CurlSSLHandleWin.cpp

    platform/playstation/PlatformScreenPlayStation.cpp

    rendering/RenderThemePlayStation.cpp

    platform/text/LocaleICU.cpp

    platform/audio/FFTFrameStub.cpp

    platform/posix/SharedBufferPOSIX.cpp

    platform/playstation/ScrollbarThemePlayStation.cpp

    platform/graphics/GLContext.cpp

    platform/generic/ScrollAnimatorGeneric.cpp

    platform/ScrollAnimationKinetic.cpp

    platform/network/playstation/NetworkStateNotifierPlayStation.cpp

    platform/text/Hyphenation.cpp

    editing/libwpe/EditorLibWPE.cpp
    platform/libwpe/PasteboardLibWPE.cpp
    platform/libwpe/PlatformKeyboardEventLibWPE.cpp
    platform/libwpe/PlatformPasteboardLibWPE.cpp

)

list(APPEND WebCore_LIBRARIES
    WPE::libwpe
)



#    platform/graphics/opengl/GraphicsContextGLOpenGLES.cpp

#    platform/graphics/opengl/GraphicsContextGLOpenGLPrivate.cpp
