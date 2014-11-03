gulp = require 'gulp'
gutil = require 'gulp-util'
source = require 'vinyl-source-stream'
watchify = require 'watchify'
browserify = require 'browserify'
to5Browserify = require '6to5-browserify'

gulp.task 'watch', ->
  bundle = null

  rebundle = ->
    bundler.bundle()
      .on 'error', gutil.log.bind(gutil)
      .pipe source('bundle.js')
      .pipe gulp.dest('./build')

  bundler = watchify browserify('./src/index.es6.js', './src/add.es6.js', watchify.args).transform(to5Browserify)
  bundler.on 'update', rebundle

  rebundle()
