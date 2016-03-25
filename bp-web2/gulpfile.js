var gulp = require('gulp');
var webpack = require('webpack-stream');
var uglify = require('gulp-uglify');
var remoteSrc = require('gulp-remote-src');
var shell = require('gulp-shell');
//require('load-gulp-tasks')(gulp, options, plugins);

gulp.task('remote', function() {
    
remoteSrc(['jsroutes.js'], {
        base: 'https://min.ority.us/'
    })
    .pipe(uglify())
    //.pipe(shell('dir'))
    .pipe(gulp.dest('./app/assets/javascripts/test_scripts'));
})


gulp.task('defaultBase', function() {
  return gulp.src('./javascripts/core.js')
    .pipe(webpack(require('./webpack.config.js') ))
    .pipe(gulp.dest('./app/assets/javascripts/bundled.js'));
});

gulp.task('default', ['remote', 'defaultBase']);