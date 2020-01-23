#include<stdio.h>

extern fibonacci();

int main(){
	long long int n;
	scanf("%lld",&n);
	long long int b=fibonacci(n);
	printf("%lld\n",b);
	return 0;
}
