#!/bin/sh


ls clightning_* \
   | xargs -n 1 -I @ echo munin-run @ \
   | sh  

ls clightning_* \
   | xargs -n 1 -I @ echo munin-run @ config \
   | sh  

ls clightning_* \
   | xargs -n 1 -I @ echo munin-run @ test \
   | sh  

ls clightning_* \
   | xargs -n 1 -I @ echo munin-run @ test2 \
   | sh  

ls clightning_* \
   | xargs -n 1 -I @ echo munin-run @ test debug \
   | sh  
