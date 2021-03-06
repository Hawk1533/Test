#!/bin/bash
wget -P ./downloads https://www.astromatic.net/download/sextractor/sextractor-2.19.5-1.x86_64.rpm
wget -P ./downloads https://www.astromatic.net/download/scamp/scamp-2.0.4-1.x86_64.rpm
wget -P ./downloads https://www.astromatic.net/download/psfex/psfex-3.17.1-1.x86_64.rpm
sudo apt-get install -y alien
sudo alien -i ./downloads/sextractor-2.19.5-1.x86_64.rpm
sudo alien -i ./downloads/scamp-2.0.4-1.x86_64.rpm
sudo alien -i ./downloads/psfex-3.17.1-1.x86_64.rpm
sudo apt-get upgrade -y scamp
sudo apt-get upgrade -y psfex
wget -P ./downloads/ https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
bash downloads/Miniconda2-latest-Linux-x86_64.sh -b -p $HOME/miniconda
sudo chmod 777 -R $HOME/miniconda
$HOME/miniconda/bin/conda create --name astro -y
source $HOME/miniconda/bin/activate astro
printf "\nexport PATH=\"\$HOME/miniconda/bin:\$PATH\"\n" >> ~/.bashrc
printf "source \$HOME/miniconda/bin/activate astro\n" >> ~/.bashrc
source ~/.bashrc
conda install -n astro -y numpy
conda install -n astro -y astropy
conda install -n astro -y future
conda install -n astro -y pandas
conda install -n astro -y scipy
conda install -n astro -y matplotlib
sudo apt-get install -y scons
sudo apt-get install -y fftw-dev
sudo apt-get install -y libfftw3-dev
sudo apt-get install -y libboost-dev
sudo apt-get install -y Boost.Python
sudo apt-get install -y git
sudo apt-get install -y swig
pip install fitsio
pip install emcee
cd downloads
wget https://github.com/rmjarvis/tmv/archive/v0.74.zip
wget https://github.com/GalSim-developers/GalSim/archive/v1.4.4.zip
wget -O - https://raw.github.com/dstndstn/tractor/master/checkout.sh > checkout.sh
unzip v0.74.zip -d $HOME
unzip v1.4.4.zip -d $HOME
cp checkout.sh $HOME
cd ..
rm -R downloads
cd $HOME
cd tmv-0.74
sudo scons install
cd ..
sudo chmod 777 -R tmv-0.74
cd GalSim-1.4.4
sudo PATH=$HOME/miniconda/envs/astro/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin scons install
cd ..
sudo chmod 777 -R GalSim-1.4.4
bash checkout.sh
cd tractor
sudo PATH=$HOME/miniconda/envs/astro/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin make
cd ..
sudo rm -f checkout.sh
sudo chmod 777 -R tractor
sudo chmod 777 -R $HOME/miniconda
cd $HOME/miniconda/envs/astro/lib/python2.7/site-packages/
rm -R galsim
printf $HOME > dirs.pth
printf "/tractor\n" >> dirs.pth
printf $HOME >> dirs.pth
printf "/tmv-0.74\n" >> dirs.pth
printf $HOME >> dirs.pth
printf "/GalSim-1.4.4\n" >> dirs.pth
sudo chmod 666 dirs.pth
