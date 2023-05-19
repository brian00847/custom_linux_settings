#include <cstdio>
#include <cstdarg>
#include <cstring>

void logMessage2(const char* loglevel, const char* filename, const int line, const char* format, va_list argp)
{
    char buff[1024];
    sprintf(buff, "%s:%d:%s: ", filename, line, loglevel);
    printf("%s\n", buff);

    vsprintf(&buff[strlen(buff)], format, argp);
    printf("%s\n", buff);

}

void logMessage1(const char* filename, const int line, const char* format, ...)
{
    va_list argp;
    va_start(argp, format);

    logMessage2("INFO", filename, line, format, argp);
    va_end(argp);
}


#define BHLOG(...) logMessage1(__FILE__, __LINE__, __VA_ARGS__)
