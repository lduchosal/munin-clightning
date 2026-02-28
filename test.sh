#!/bin/sh

ls lightningd_* \
   | xargs -n 1 -I @ echo sh @ test \
   | sh  

ls lightningd_* \
   | xargs -n 1 -I @ echo sh @ test2 \
   | sh  
