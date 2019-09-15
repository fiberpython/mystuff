/* function main begins program execution */
8 int main( void )
9{
10 int number1; /* first integer */
11 int number2; /* second integer */
12 int number3; /* third integer */
13
14 printf( "Enter three integers: " );
15 scanf( "%d%d%d", &number1, &number2, &number3 );
16
17 /* number1, number2 and number3 are arguments
18 to the maximum function call */
19 printf( "Maximum is: %d\n", maximum( number1, number2, number3 ) );
20 return 0; /* indicates successful termination */
21 } /* end main */


int maximum( int x, int y, int z ) 
{
    int max = x; /* assume x is largest */
    if ( y > max ) { /* if y is larger than max, assign y to max */
        max = y;
                   } /* end if */

    if ( z > max ) { /* if z is larger than max, assign z to max */
        max = z;
                   } /* end if */
    return max; /* max is largest value */ 
} /* end function maximum */