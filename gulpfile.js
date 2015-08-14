var gulp        = require('gulp');
var less        = require('gulp-less');
var browserSync = require('browser-sync');

// Registering a 'less' task that just compile our LESS files to CSS
gulp.task('less', function() {
  return gulp.src('./resources/less/main.less')
    .pipe(less())
    .pipe(gulp.dest('./public/stylesheets'));
});

// Let's watch our LESS files and compile them at each modification
gulp.task('watch', function () {
  gulp.watch(['./resources/less/*.less'], ['less']);
});

//
gulp.task('serve', function () {
  browserSync({
    // By default, Play is listening on port 9000
    proxy: 'localhost:9000',
    // We will set BrowserSync on the port 9001
    port: 9001,
    // Reload all assets
    // Important: you need to specify the path on your source code
    // not the path on the url
    files: ['public/stylesheets/*.css', 'public/javascripts/*.js', 'app/views/*.html'],
    open: false
  });
});

// Creating the default gulp task
gulp.task('default', ['less', 'watch', 'serve']);


/*
This setup assumes you already have sbt and NPM installed on your machine.

*  Go to the root of the project
*  Run npm install to grab some dependencies
*  Open 2 shells
*  Run sbt run in the first one and wait for it to finish. You should have a Play server running now.
*  Run gulp in the second one, this will start a BrowserSync proxy on top of the Play server (run npm install -g gulp if you don't have gulp yet).
*  Enjoy the result at http://localhost:9001
*/