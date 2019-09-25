void swap (long *xp, long *yp);

void test_swap();

void test_swap()
{
    long xx=0x1122334455667788;
    long yx=0x99AABBCCDDEEFF00;
    swap(&xx,&yx);
}

void inplace_swap (long *xp, long *yp) 
{
    *xp = *xp^*yp; 
    *yp = *xp^*yp; 
    *xp = *xp^*yp; 
}

void swap (long *xp, long *yp) 
{
  long t0 = *xp;
  long t1 = *yp;
  *xp = t1;
  *yp = t0;
}
