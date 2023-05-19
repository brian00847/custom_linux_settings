#include "log1.hpp"


int main() {
    unsigned int x = 42;
    
    logMessage1(__FILE__, __LINE__, "Hello: %d", x);
    BHLOG("Doing a log msg here: %d", 123);

    return 0;
}
