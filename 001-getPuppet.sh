#! /bin/bash

echo Start installing puppet.

echo Refreshing repositories ...
sudo zypper --non-interactive ref

echo Updating packages ...
sudo zypper --non-interactive update -y
sudo zypper --non-interactive upgrade -y

echo Installing puppet and helper modules ...
sudo zypper --non-interactive install -y puppet 
sudo puppet module install darin/zypprepo

echo Done installing puppet.
