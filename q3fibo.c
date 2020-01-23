#include<stdio.h>

extern int main();

extern long long int fibonacci(long long int n){
	long long int i=2,x=1,a=1;
	while(i<=a){
		long long int temp=x;
		x+=a;
		a=temp;
		i++;
	}
	return x;
}
