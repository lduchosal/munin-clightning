#!/bin/sh


ls lightningd_* \
   | xargs -n 1 -I @ echo munin-run @ \
   | sh  

ls lightningd_* \
   | xargs -n 1 -I @ echo munin-run @ config \
   | sh  

ls lightningd_* \
   | xargs -n 1 -I @ echo munin-run @ test \
   | sh  

ls lightningd_* \
   | xargs -n 1 -I @ echo munin-run @ test2 \
   | sh  

ls lightningd_* \
   | xargs -n 1 -I @ echo munin-run @ test debug \
   | sh  
