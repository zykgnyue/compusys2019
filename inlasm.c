#include <stdio.h>
int inlineasm();
int main()
{
    printf("Test inline asm!\n");
    int ret_result=inlineasm();
}

int inlineasm()
{
    int a=10, b;
    asm volatile ( \
        "movl %1, %%eax; \n\t \
        movl %%eax, %0;"
            :"=r"(b)        /* output */
            :"r"(a)         /* input */
            :"%eax"         /* clobbered register */
            );  
    return b;     
}