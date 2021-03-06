gulp = require 'gulp'
browserSync = require 'browser-sync'
config = require './config.coffee'

gulp.task 'serve', ['sass'], ->
  browserSync
    server: {baseDir: config.path}
    port: 4000
    open: false
    reloadOnRestart: false
    ghostMode: true
    notify: false

  gulp.watch ['src/**/*.ts', 'server/**/*.ts'], ['tsLint']
  gulp.watch ['server/**/*.ts'], ['tsTranspileServer']
  gulp.watch(
    ['src/**/*.scss', '!src/app/**/*.scss']
    ['sass', 'scssLint']
  )
  gulp.watch(
    ['!src/**/*.scss', 'src/app/**/*.scss']
    ['sassComponents', 'scssLint', browserSync.reload]
  )
  gulp.watch(
    ['src/**/*.jade', '!src/app/**/*.jade']
    ['jade', browserSync.reload]
  )
  gulp.watch(
    ['!src/**/*.jade', 'src/app/**/*.jade']
    ['jadeComponents', browserSync.reload]
  )

module.exports = gulp
