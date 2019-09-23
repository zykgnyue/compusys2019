
#include <cstdio>

using namespace std;
void showbytes(unsigned char *p, size_t len);
unsigned long bitCount(unsigned long x);
void showFloatComponents(float x);
void inplace_swap(int *x,int *y);
void reverseArray(int *ary,int len);

int ary[]={1,2,3,4,5,6,7,8,9,10,11};
void reverseArray(int *ary,int len)
{
	printf("sizeof ary= %d\n",len);
	for(int i=0;i<len/2;i++)
	{
		inplace_swap(&ary[i],&ary[len-i-1]);
	}
	for(int i=0;i<len;i++)
	{
		printf("ary[%d]=%d\n",i,ary[i]);
	}

}

void inplace_swap(int *x,int *y)
{
	printf("0x%lx 0x%lx\n",(unsigned long)x,(unsigned long)y);
	printf("%d %d\n",*x,*y);
	*y=(*x)^(*y);
	*x=(*x)^(*y);
	*y=(*x)^(*y);
}

void showbytes(unsigned char *p, size_t len)
{
	for(size_t n=0;n<len;n++)
	{
		printf("0x%lx:0x%.2X\n",(unsigned long)(&p[n]),p[n]);
	}
}

int main()
{
#if 0
	long xVal=0x1234A;
	float fVal=(float)xVal;
	double dVal=(double)xVal;

	printf("long\n");
	showbytes((unsigned char *)&xVal,sizeof(long));
	printf("float\n");
	showbytes((unsigned char *)&fVal,sizeof(float));
	printf("double\n");
	showbytes((unsigned char *)&dVal,sizeof(double));


	int x=55;
	int y=66;
#endif
	unsigned long xBits=bitCount(0x5555555555555555L);
	printf("bit number=%ld\n",xBits);
	xBits=bitCount(0xFFFFFFFFFFFFFFFFL);
	printf("bit number=%ld\n",xBits);
//	reverseArray(ary,sizeof(ary)/sizeof(int));

//	printf("Org: x=%d, y=%d\n",x,y);
//	inplace_swap(&x,&y);
//	printf("Swaped: x=%d, y=%d\n",x,y);
    return 0;
}

void showFloatComponents(float x)
{
	//1.show s, exp, frac
	//2.show s,E,M
	//3.show float type:denormalized/normalized/inf/nan
}

//not implemented
unsigned long bitCount4(unsigned long x)
{
	long val=0;
	for(int i=0;i<4;i++)
	{
		val +=x&0x0101010101010101L;
		x>>=1;

	}
	val +=(val>>32);
	val +=(val>>16);
	val +=(val>>8);
	return val&0xFF;
}

unsigned long bitCount(unsigned long x)
{
	long val=0;
	for(int i=0;i<8;i++)
	{
		printf("x=%.16lx ",x);
		printf("mask(x)=%.16lx \n",x&0x0101010101010101L);
		val +=x&0x0101010101010101L;
		printf("Val=%.16lx\n",val);
		x>>=1;

	}
	val +=(val>>32);
	printf("val=%.16lx\\n",val);
	val +=(val>>16);
	printf("val=%.16lx\n",val);
	val +=(val>>8);
	printf("val=%.16lx\n",val);
	return val&0xFF;
}

