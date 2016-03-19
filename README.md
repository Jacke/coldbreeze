# Minority platform

[![Circle CI](https://circleci.com/gh/Jacke/coldbreeze/tree/master.svg?style=svg)](https://circleci.com/gh/Jacke/coldbreeze/tree/master)

Minority platform is a cloud-enabled, language-agnostic platform for workflow managment.

  - Actions
  - fLOWS
  - Structures
  - Data
  - Launch
  - Result
  - Events/Reaction

### Version
1.2.0

### Tech

Dillinger uses a number of open source projects to work properly:

* [Playframework] -


And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.

# Installation

Building a mobile messaging application is quite a complex procedure that requires a lot of preparation, e.g.: have developer accounts with Google and Apple, have SSL certificates for your servers, integrate the server with various services like SMS gate, push systems, etc.

For more info, you can read the [server installation manual](docs/SERVER.md). After installing the server, you can [start building the apps](docs/APPS.md).

### Run instructions

You need Run:

```sh
$ sbt bp-web/stage
```


### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantanously see your updates!

Open your favorite Terminal and run these commands.

First Tab:
```sh
$ node app
```

Second Tab:
```sh
$ gulp watch
```

(optional) Third:
```sh
$ karma start
```




# License

Minority Platform released under [Empia proprietary license](LICENSE).


# Contacts

* Twitter: [@stanthoughts](https://twitter.com/stanthoughts)
* Email: [iamjacke@gmail.com](mailto:iamjacke@gmail.com)



[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [@thomasfuchs]: <http://twitter.com/thomasfuchs>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [marked]: <https://github.com/chjj/marked>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [keymaster.js]: <https://github.com/madrobby/keymaster>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]:  <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
