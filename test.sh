#!/bin/sh

ls clightning_* \
   | xargs -n 1 -I @ echo sh @ test \
   | sh  

ls clightning_* \
   | xargs -n 1 -I @ echo sh @ test2 \
   | sh  
