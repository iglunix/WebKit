/*
 * Copyright (C) 2014 Igalia S.L.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "PlatformKeyboardEvent.h"

namespace WebCore {

// FIXME: This is incomplete. We should change this to mirror
// more like what Firefox does, and generate these switch statements
// at build time.
// https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key/Key_Values
String PlatformKeyboardEvent::keyValueForWPEKeyCode(unsigned keyCode)
{
    return "Unidentified"_s;
}

// FIXME: This is incomplete. We should change this to mirror
// more like what Firefox does, and generate these switch statements
// at build time.
// https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/code
String PlatformKeyboardEvent::keyCodeForHardwareKeyCode(unsigned keyCode)
{
    return "Unidentified"_s;
}

// FIXME: This is incomplete. We should change this to mirror
// more like what Firefox does, and generate these switch statements
// at build time.
String PlatformKeyboardEvent::keyIdentifierForWPEKeyCode(unsigned keyCode)
{
    return "Unidentified"_s;
}

int PlatformKeyboardEvent::windowsKeyCodeForWPEKeyCode(unsigned keycode)
{
    return 0;
}

String PlatformKeyboardEvent::singleCharacterString(unsigned val)
{
    return { };
}

void PlatformKeyboardEvent::disambiguateKeyDownEvent(Type type, bool backwardsCompatibility)
{
    ASSERT(m_type == KeyDown);
    m_type = type;
    if (backwardsCompatibility || m_handledByInputMethod)
        return;

    if (type == PlatformEvent::RawKeyDown) {
        m_text = String();
        m_unmodifiedText = String();
    } else {
        m_keyIdentifier = String();
        m_windowsVirtualKeyCode = 0;
    }
}

bool PlatformKeyboardEvent::currentCapsLockState()
{
    return false;
}

void PlatformKeyboardEvent::getCurrentModifierState(bool&, bool&, bool&, bool&)
{
}

} // namespace WebCore
