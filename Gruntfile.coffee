module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      build:
        expand: true
        cwd: 'coffee-src/'
        src: '**/*.coffee'
        dest: 'app/'
        ext: '.js'
    watch:
      coffee:
        files: ['<%= coffee.build.src %>', 'Gruntfile.coffee']
        tasks: ['coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'copy-components', () ->
    grunt.file.mkdir 'app/js/lib'
    component = grunt.file.readJSON 'component.json'
    for name of component.dependencies
      grunt.file.copy "components/#{name}/#{name}.js", "app/js/lib/#{name}.js"

  grunt.registerTask 'default', ['copy-components', 'coffee']
