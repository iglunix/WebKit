#include "config.h"

//#if ENABLE(WEBGL)

#include "GraphicsContextGLOpenGL.h"
#include <GLFW/glfw3.h>

namespace WebCore {

static GLFWwindow *window;

RefPtr<GraphicsContextGLOpenGL> GraphicsContextGLOpenGL::create(GraphicsContextGLAttributes attrs, HostWindow *hostWindow)
{
    // wtf are we doing here
}

bool GraphicsContextGLOpenGL::makeContextCurrent()
{
    // TODO: glfwMakeContextCurrent(window);
}



bool GraphicsContextGLOpenGL::isGLES2Compliant() const
{
    return true;
}

void GraphicsContextGLOpenGL::checkGPUStatus()
{
    // TODO
}

}

//#endif
