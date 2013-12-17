#! /bin/bash

echo Start running puppet. 

sudo puppet apply --verbose manifests/*.pp

echo Done running puppet. 
