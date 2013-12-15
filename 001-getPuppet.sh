echo Refreshing repositories ...
sudo zypper --no-interactive ref

echo Updating packages ...
sudo zypper --no-interactive update -y
sudo zypper --no-interactive upgrade -y

echo Installing puppet and helper modules ...
sudo zypper --no-interactive install -y puppet 
sudo puppet module install darin/zypprepo

