
#include "BHCfg.hpp"

#include <cstdio>


void foo1()
{
    printf("key [%s] val [%s]\n", "abc", BHConfig::getCfg()->getString("abc").c_str());
    printf("key [%s] val [%d]\n", "abc", BHConfig::getCfg()->getInt("abc"));
    printf("key [%s] val [%d]\n", "abcx", BHConfig::getCfg()->getInt("abcx"));

    printf("key [%s] val [%f]\n", "f1", BHConfig::getCfg()->getFloat("f1"));
    printf("key [%s] val [%f]\n", "abcx", BHConfig::getCfg()->getFloat("abcx"));

}

void foo2()
{
    printf("XX key [%s] val [%s]\n", "abc", BHConfig::getCfg()->getString("abc").c_str());

}

int main(const int argc, const char** argv)
{
    foo1();
    foo2();

    return 0;
}

