
#include <cstdio>
#include <utility>


struct A
{
    int x1 = 0;

    A(const int v1)
    {
        this->x1 = v1;

    }

    A(const A& other)
    {
        this->x1 = other.x1;
        //other.x1 = 0;
    }

    A(A&& other)
    {
        this->x1 = other.x1;
        other.x1 = 0;
    }
};

struct B
{
    int x1 = 0;

    B(const int v1)
    {
        this->x1 = v1;

    }

    B(const B& other)
    {
        this->x1 = other.x1;
        //other.x1 = 0;
    }
};


template<typename T>
void dump(const T& v)
{
    printf("v %d\n", v.x1);
}


void foo1()
{
    A a1(5);
    dump(a1);

    A a2(std::move(a1));

    dump(a1);
    dump(a2);


}

void foo2()
{
    //std::move() calls && constructor if available. Otherwise uses copy constructor
    B b1(6);
    dump(b1);

    B b2(std::move(b1));
    dump(b1);
    dump(b2);

}

int main()
{
    printf("Hello world\n");

    foo1();
    foo2();
    return 0;
}
    

