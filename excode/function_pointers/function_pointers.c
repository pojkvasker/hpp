/**
 * Simple calculator implemented using function pointers.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Anastasia Kruchinina <anastasia.kruchinina@it.uu.se>
 *
 */


#include <stdio.h>
#include <stdlib.h>


void calculate(double a, double b,
               double (*funptr)(double, double));

double add(double a, double b);
double subtract(double a, double b);
double multiply(double a, double b);
double divide(double a, double b);


int main(int argc, char const *argv[])
{
        printf("================================================\n");
        printf("This is a simple calculator. Supported operations are +, -, * and /. For example, try to enter 4+7.\n");
        printf("================================================\n");
        double n1, n2;
        char c;
        double (*funptr)(double, double); // define a function pointer
        while(1)
        {
                printf("Please enter an operation between two numbers (press Ctrl+C to stop): ");
                int ret = scanf("%lf %c %lf", &n1, &c, &n2);
                if(ret != 3) {
                        printf("Breaking loop now. Something went wrong...\n");
                        break;
                }

                switch(c) {
                case '+': {funptr = &add; break;}
                // note that you can also write without & sign:
                //   case '+': {funptr = add; break;}
                case '-': {funptr = &subtract; break;}
                case '*': {funptr = &multiply; break;}
                case '/': {funptr = &divide; break;}
                default: "Wrong operation, try again.";
                }
                calculate(n1, n2, funptr);
        }
        return 0;
}


void calculate(double a, double b,
               double (*funptr)(double, double))
{
        printf("result: %lf \n", (*funptr)(a, b));
}


double add(double a, double b)
{
        return a+b;
}

double subtract(double a, double b)
{
        return a-b;
}


double multiply(double a, double b)
{
        return a*b;
}


double divide(double a, double b)
{
        return a/b;
}
