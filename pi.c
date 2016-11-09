/* Programa para calcular Pi usando el metodo Monte Carlo */
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
int main()
{
   int N=100000000; int i,count=0;
   double x,y,z,pi;
   srand(1);
   for ( i=0; i<N; i++) {
      x = (double)rand()/RAND_MAX;
      y = (double)rand()/RAND_MAX;
      z = x*x+y*y;
      if (z<=1) count++;
      }
   printf ("Numero de puntos = %d \n",N);
   printf ("Numero de puntos dentro del circulo \
   = %d +- %g \n",count,sqrt(count));
   printf ("Pi = 4 N_dentro/N_total= %g +- %g \n"\
   ,(double)count/N*4,sqrt(count)/N*4);
}
