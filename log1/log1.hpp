#ifndef LOG1_HPP__
#define LOG1_HPP__

#include <cstdio>
#include <cstdarg>
#include <cstring>

#define LOGLEVEL_DBG 0
#define LOGLEVEL_INFO 1
#define LOGLEVEL_WARN 2
#define LOGLEVEL_ERR 3

static
const char* getFilename(const char* filepath)
{
    if (filepath == nullptr)
    {
        return nullptr;
    }

    // Find the last occurrence of '/' or '\'
    const char* lastSlash = std::strrchr(filepath, '/');
    const char* lastBackslash = std::strrchr(filepath, '\\');

    // Determine which is the actual last separator
    const char* lastSeparator = lastSlash > lastBackslash ? lastSlash : lastBackslash;

    // If no separator is found, return the whole filepath as the filename
    if (lastSeparator == nullptr)
    {
        return filepath;
    }
    else
    {
        // Return the pointer to the character after the last separator
        return lastSeparator + 1;
    }
}

static
void logMessage2(const char* loglevel, const char* filepath, const int line, const char* funcname, const char* format, va_list argp)
{
    char buff[1024];
    sprintf(buff, "%-20s:%04d:%-4s: ", getFilename(filepath), line, loglevel);
    //printf("%s\n", buff);

    vsprintf(&buff[strlen(buff)], format, argp);
    printf("%s\n", buff);

}

static
void logMessage1(const char* filename, const int line, const int loglevel, const char* funcname, const char* format, ...)
{
    va_list argp;
    va_start(argp, format);
    const char* loglevel_str = nullptr;
    switch (loglevel)
    {
        case LOGLEVEL_DBG: loglevel_str = "DBG"; break;
        case LOGLEVEL_WARN: loglevel_str = "WARN"; break;
        case LOGLEVEL_ERR: loglevel_str = "ERR"; break;
        default:
                           loglevel_str = "INFO"; break;
    }

    logMessage2(loglevel_str, filename, line, funcname, format, argp);
    va_end(argp);
}


#define BHLOG_INFO(...) logMessage1(__FILE__, __LINE__, LOGLEVEL_INFO, __FUNCTION__, __VA_ARGS__)
#define BHLOG_ERR(...) logMessage1(__FILE__, __LINE__, LOGLEVEL_ERR, __FUNCTION__, __VA_ARGS__)

#endif
