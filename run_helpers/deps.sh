#!/usr/bin/env bash

VERSION="2.11.6"
sudo apt-get -y install openjdk-8-jre
sudo apt-get -y install openjdk-8-jdk
sudo apt-get -y install postgresql-9.4
sudo apt-get -y install redis-server
sudo apt-get -y install ruby
sudo gem install sass
sudo apt-get -y install compass
echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
deb http://dl.bintray.com/sbt/debian /
sudo apt-get update
sudo apt-get -y install sbt
wget http://downloads.typesafe.com/scala/$VERSION/scala-$VERSION.deb
sudo dpkg -i scala-$VERSION.deb
rm scala-$VERSION.deb
sudo apt-get -y install docker.io
sudo apt-get -y install ruby-compass
sudo apt-get -y install mongodb