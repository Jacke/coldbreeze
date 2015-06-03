#!/usr/bin/env bash

VERSION="2.11.6"

sudo apt-get install openjdk8-jre
sudo apt-get install openjdk8-jdk
sudo apt-get install postgresql-9.4
sudo apt-get install redis-server
sudo apt-get install ruby
sudo gem install sass
sudo apt-get install compass
echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
deb http://dl.bintray.com/sbt/debian /
sudo apt-get update
sudo apt-get install sbt
wget http://downloads.typesafe.com/scala/$VERSION/scala-$VERSION.deb
sudo dpkg -i scala-$VERSION.deb
rm scala-$VERSION.deb
