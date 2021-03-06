# Building Web Application

Building of Web App is separated to two parts: Web App itself and actor-js Library. Web App uses [actor-js](https://www.npmjs.com/package/actor-js) library from NPM that is compiled from java sources and published by Actor Team. If you want to fork it, you may ask for support in our oss group, but in almost all cases you don't need this and we strictly don't recommend to do this.

### Requirements

For building web app, you need:
* **JavaScript Dependency Manager**: [NodeJS 4.2.2+ LTS](https://nodejs.org/). Use [Node Version Manager](https://github.com/creationix/nvm) for Linux/OSX and [official installer](https://nodejs.org/) for Windows. In most cases you have incorrect NodeJS version installed via OS's packange manager, you need to remove it first and install Node from scratch. After installin NVM to you machine ```nvm alias default v4.2.2```.
* Update NPM for latest version by running ```npm update -g```
* **Build System**: [GulpJS](https://gulphs.com/). Please, isntall it with command `npm install --global gulp` after installing NodeJS

#### Ubuntu

Install additional packanges
```sudo apt-get install python make g++ bzip2 libjpeg62-dev```

### Build

* Install all required dependencies: `npm install`
* Assemble web distributive: `guilp dist --release`
* Starting development server: `guilp dev`