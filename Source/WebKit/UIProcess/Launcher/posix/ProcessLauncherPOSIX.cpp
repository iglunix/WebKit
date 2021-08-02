/*
 * Copyright (C) 2020 Sony Interactive Entertainment Inc.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1.  Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 * 2.  Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * 3.  Neither the name of Apple Computer, Inc. ("Apple") nor the names of
 *     its contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE AND ITS CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL APPLE OR ITS CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "ProcessLauncher.h"
#include "ProcessExecutablePath.h"

#include <stdint.h>
#include <unistd.h>
#include <sys/socket.h>

namespace WebKit {

void ProcessLauncher::launchProcess()
{
    IPC::Connection::SocketPair sockets = IPC::Connection::createPlatformConnection(IPC::Connection::ConnectionOptions::SetCloexecOnServer);

    // TODO: is this correct?
    char const *executablePath;
    switch (m_launchOptions.processType) {
    case ProcessLauncher::ProcessType::Web:
        executablePath = "WebKitWebProcess";
        break;
    case ProcessLauncher::ProcessType::Network:
        executablePath = "WebKitNetworkProcess";
        break;
#if ENABLE(GPU_PROCESS)
    case ProcessLauncher::ProcessType::GPU:
        executablePath = "WebKitGPUProcess";
        break;
#endif
    default:
        ASSERT_NOT_REACHED();
        return;
    }

    // Do we pass Host PID here?
    char *args[] = {
        strdup(String::number(sockets.client).utf8().data()),
        nullptr,
    };

    pid_t pid = fork();

    if (!pid) {
        execvp(executablePath, &args[0]);
    }

    close(sockets.client);

    m_processIdentifier = pid;

    // We've finished launching the process, message back to the main run loop.
    RefPtr<ProcessLauncher> protectedThis(this);
    RunLoop::main().dispatch([=] {
        protectedThis->didFinishLaunchingProcess(pid, sockets.server);
    });
}

void ProcessLauncher::terminateProcess()
{
    if (!m_processIdentifier)
        return;

    kill(m_processIdentifier, SIGKILL);
}

void ProcessLauncher::platformInvalidate()
{
    m_processIdentifier = 0;
}

} // namespace WebKit
