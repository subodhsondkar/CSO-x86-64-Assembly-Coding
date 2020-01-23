#include<stdio.h>

int fibonacci(int n){
	int x=1,a=1,i=2;
	while(i<n){
		int temp=x;
		x+=a;
		a=temp;
		i++;
	}
	printf("%d\n",x);
	return x;
}

