grunt.initConfig({

    'http-server': {
        'dev': {
                // the server root directory
                root: 'index.html',

                port: 8282,
                host: "127.0.0.1",

                cache: 1,
                showDir : true,
                autoIndex: true,
                defaultExt: "html",

                //wait or not for the process to finish
                runInBackground: false
            }
        }
});

grunt.loadNpmTasks('grunt-http-server');
