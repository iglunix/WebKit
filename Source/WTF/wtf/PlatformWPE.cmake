list(APPEND WTF_PUBLIC_HEADERS
    linux/ProcessMemoryFootprint.h
    linux/CurrentProcessMemoryStatus.h
)

list(APPEND WTF_SOURCES
    generic/MainThreadGeneric.cpp
    generic/WorkQueueGeneric.cpp
	generic/RunLoopGeneric.cpp

	posix/OSAllocatorPOSIX.cpp
	posix/ThreadingPOSIX.cpp

	posix/FileSystemPOSIX.cpp
	unix/UniStdExtrasUnix.cpp

    linux/CurrentProcessMemoryStatus.cpp
	linux/MemoryFootprintLinux.cpp

    posix/OSAllocatorPOSIX.cpp
    posix/ThreadingPOSIX.cpp

    text/unix/TextBreakIteratorInternalICUUnix.cpp

    unix/CPUTimeUnix.cpp
    unix/LanguageUnix.cpp
    unix/MemoryPressureHandlerUnix.cpp
    unix/UniStdExtrasUnix.cpp
)

list(APPEND WTF_LIBRARIES
    Threads::Threads
    ZLIB::ZLIB
)

if (Systemd_FOUND)
    list(APPEND WTF_LIBRARIES Systemd::Systemd)
endif ()

list(APPEND WTF_SYSTEM_INCLUDE_DIRECTORIES
)
