/*
 * File: random.c
 * Date: 2021-07-21
 * Program: pseudo-random function
 * Author: Jenswa
 * Copyright (c) 2021; Johan Jansen
 * License: New BSD License
 */

//variables
unsigned long seed = 13;  // Seed for the random number generator

//The pseudo-random number generator returns a number between zero and max (max is excluded!)
long random(signed long max) {
  //seed *= 69069;
  //return (max * (seed >> 16)) / 0x10000;
  // other random code taken from Tank Ravagers by Loirak Development (via the BrownianFade demo)
  seed *= 20077;
  seed += 12345;
  return ( ( ( ( seed >> 16 ) & 32676 )*max ) >> 15 );
}
