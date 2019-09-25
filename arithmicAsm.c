unsigned short int movword(unsigned short int x, unsigned long *y)
{
    *y =x;
    return x+2;
}
long m12(long x)
{
    return x*12;
}

long arith
(long x, long y, long z)
{
  long t1 = x+y;
  long t2 = z+t1;
  long t3 = x+4;
  long t4 = y * 48;
  long t5 = t3 + t4;
  long rval = t2 * t5;
  return rval;
}

long logical(long x, long y)
{
   long t1 = x^y;
   long t2 = t1 >> 17;
   long mask = (1<<13) - 7;
   long rval = t2 & mask;
   return rval;
}

int gt (long x, long y)
{
  return x > y;
}
