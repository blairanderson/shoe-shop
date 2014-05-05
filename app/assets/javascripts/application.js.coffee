# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require vendor/underscore-min
#= require bootstrap-tour
#= require tour-steps
#= require post

# class Parser
#   constructor: (options) ->
#     @url = options.url
#     @root_name = options.root_name
#
#   get: ->
#     $.get @url, (data) =>
#       @data = data[@root_name]
#
# #   these defaults are demo data.
#   defaults:
#     url: 'https://www.filepicker.io/api/file/knRDjPNgSbCMGz694a0J'
#     filename: 'hello.txt'
#     mimetype: 'text/plain'
#     isWriteable: true
#     size: 100
#
#   read: (pair) ->
#     filepicker.read @defaults, (data) =>
#       # do stuff here
#
# class Runner
#   go: ->
#     @parser = new Parser(url: '/pairs.json', root_name: 'posts')
#     @parser.get()
#
#
$ ->
  filepicker.setKey('AoaxmLrr2Tj2EbZv0JS0Mz')
#   window.pipe = new Runner()
#   window.pipe.go().done =>
#     data = pipe.parser.data
#
#     _.each data, (pair) =>
#       pipe.read(pair)
