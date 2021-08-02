list(APPEND WTF_SOURCES
    generic/WorkQueueGeneric.cpp
    generic/MainThreadGeneric.cpp
    generic/RunLoopGeneric.cpp
    generic/WorkQueueGeneric.cpp

    posix/OSAllocatorPOSIX.cpp
    posix/ThreadingPOSIX.cpp

    text/unix/TextBreakIteratorInternalICUUnix.cpp

    unix/LanguageUnix.cpp
    unix/CPUTimeUnix.cpp
    posix/FileSystemPOSIX.cpp
    unix/UniStdExtrasUnix.cpp

    linux/CurrentProcessMemoryStatus.cpp
    linux/MemoryFootprintLinux.cpp
    unix/MemoryPressureHandlerUnix.cpp

    generic/RunLoopGeneric.cpp
)

list(APPEND WTF_PUBLIC_HEADERS
    linux/ProcessMemoryFootprint.h
    linux/CurrentProcessMemoryStatus.h
)

list(APPEND WTF_LIBRARIES
    Threads::Threads
)
