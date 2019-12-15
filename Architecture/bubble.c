#include<stdio.h>
 
void BubbleSort(int num[10]);
void swap(int *a, int *b);
 
int main(int argc, char *argv[])
{
	int num[10] = {4, 7, 3, 9, 6, 1, 8, 0, 2, 5};
	BubbleSort(num);
	for (int i = 0; i <= 9; i++)
		printf("%d", num[i]);
	return 0;
}
 
void BubbleSort(int num[10])
{
	int n = 10;
	for (int j = n - 1; j >= 1; j--) {
		for (int i = 0; i <= j - 1; i++) {
			if (num[i] > num[i + 1])
				swap(&num[i], &num[i + 1]);
		}
	}
}
 
void swap(int *a, int *b)
{
	*a = *a ^ *b;
	*b = *a ^ *b;
	*a = *a ^ *b;
}