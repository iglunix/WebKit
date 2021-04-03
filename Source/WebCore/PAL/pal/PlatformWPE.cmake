list(APPEND PAL_PUBLIC_HEADERS

)

list(APPEND PAL_SOURCES
    crypto/openssl/CryptoDigestOpenSSL.cpp

    system/ClockGeneric.cpp
    system/Sound.cpp

    text/KillRing.cpp

    unix/LoggingUnix.cpp
)

if (ENABLE_WEB_CRYPTO)
    list(APPEND PAL_PUBLIC_HEADERS
        crypto/tasn1/Utilities.h
    )

    list(APPEND PAL_SOURCES
        crypto/tasn1/Utilities.cpp
    )
endif ()

list(APPEND PAL_SYSTEM_INCLUDE_DIRECTORIES)
