module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks
  grunt.loadNpmTasks('grunt-recess');
  grunt.loadNpmTasks('grunt-growl');

  grunt.initConfig({

    lint : {
      all: [
        '../js/athey.js',
        '../js/alertManager.js'
      ]
    },

    minify : {
      all: [
        '../less/athey.less',
        '../less/ie7.less'
      ]
    },

    recess: {
      main: {
        src: [
        '../less/athey.less'
        ],
        dest: '../css/athey.2.5.0.css',
        options: {
            compile: true,
            compress: true
        }
      },
      ie7: {
        src: [
        '../less/ie7.less'
        ],
        dest: '../css/ie7.css',
        options: {
            compile: true,
            compress: true
        }
      }
    },

    watch : {
      scripts: {
        files: [
          '../less/*.less',
          '../js/*.js',
          '../../../js/*.js'
        ],
        tasks: 'lint:all min:dist recess:ie7 recess:main'
      }
    },

    min: {
      dist: {
        src : [
          '../../../bootstrap/docs/assets/js/jquery.js',
          '../../../js/lodash.js',
          '../../../bootstrap/docs/assets/js/bootstrap.min.js',
          '../../../js/responsimage.js',
          '../../../js/jquery.cookie.js',
          '../../../js/mediaelement.js',
          '../../../js/reftagger.js',
          '<config:lint.all>'],
        dest: '../js/athey.2.5.0.js',
        separator: ';'
      }
    },

    growl : {
      compile : {
        title : "Grunt.js",
        message : "Grunt was run successfully"
      }
    }

});

// Main task
grunt.registerTask('default', 'lint:all min:dist recess:ie7 recess:main growl')};