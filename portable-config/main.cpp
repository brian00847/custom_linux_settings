
#include "BHCfg.hpp"

#include <cstdio>


int main(const int argc, const char** argv)
{
    BHConfig cfg;
    cfg.init();

    printf("key [%s] val [%s]\n", "abc", cfg.getString("abc").c_str());
    printf("key [%s] val [%d]\n", "abc", cfg.getInt("abc"));
    printf("key [%s] val [%d]\n", "abcx", cfg.getInt("abcx"));

    printf("key [%s] val [%f]\n", "f1", cfg.getFloat("f1"));
    printf("key [%s] val [%f]\n", "abcx", cfg.getFloat("abcx"));

    return 0;
}

