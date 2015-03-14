#!/usr/bin/env node

var run = require('docker-run')

var volumes = {}
volumes[process.cwd()] = '/data'

var options = {
  volumes: volumes,
  argv: process.argv.slice(2)
}

var child = run('maxogden/gifify', options)

child.stdout.pipe(process.stdout)
child.stderr.pipe(process.stderr)

child.on('error', function(err) {
  console.error('Error: %s', err.message)
  process.exit(1)
})

child.on('exit', function(code) {
  process.exit(code)
})

process.on('SIGINT', function() {
  child.destroy()
})

process.on('SIGTERM', function() {
  child.destroy()
})
