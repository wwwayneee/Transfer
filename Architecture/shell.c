#include <stdio.h>
#include <malloc.h>

void Shell_sort(int *a, int len);   //函数声明

int main(void)
{
    int len = 10;
    int num[10] = {4, 7, 3, 9, 6, 1, 8, 0, 2, 5};

    Shell_sort(num, len);    //调用希尔排序函数
    
    return 0;
}

void Shell_sort(int *a, int len)
{
    int i;
    int j;
    int temp;  
    int gap;  //步长
    for (gap = len / 2; gap >= 1; gap /= 2) {  // 步长初始化为数组长度的一半，每次遍历后步长减半
        for (i = 0 + gap; i < len; i += gap) {   //对步长为gap的元素进行直插排序，当gap为1时，就是直插排序
            temp = a[i];  //备份a[i]的值
            j = i - gap;  //j初始化为i的前一个元素（与i相差gap长度）
            while (j >= 0 && a[j] > temp) {
                a[j + gap] = a[j];  //将在a[i]前且比temp的值大的元素向后移动一位
                j -= gap;
            }
            a[j + gap] = temp; 
        }
    }
}