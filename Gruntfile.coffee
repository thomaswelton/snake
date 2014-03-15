module.exports = (grunt) =>
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		## Growl notifications
		notify:
			compass:
				options:
					title: "CSS Files built"
					message: "Compass task complete"
			coffee:
				options:
					title: "CoffeeScript Files built"
					message: "Coffee task complete"

			production:
				options:
					title: "Build Complete"
					message: "The production environment has been optimized"

		notify_hooks:
			options:
				enabled: true

		## Bower, for front end dependencies
		bower:
			install:
				options:
					targetDir: 'htdocs/assets/scripts/components'

		## Run tasks when files are modified
		regarde:
			sass:
				## Compile SCSS when scss or sass file are modified, or items in the sprites directory are modified
				files: ['sass/**/*.{scss,sass}','htdocs/assets/images/sprites/**/*.png']
				tasks: ['compass:dist', 'notify:compass', 'livereload']

			coffee:
				files: 'coffee/**/*.coffee'
				tasks: ['coffee', 'notify:coffee', 'livereload']

		## Compile SCSS
		compass:
			prod:
				options:
					noLineComments: true
					outputStyle: 'compressed'
					force: true

			dist:
				options:
					config: 'config.rb'
					noLineComments: false
					outputStyle: 'expanded'
					force: true


		## Compile coffeescript
		coffee:
			glob_to_multiple:
				expand: true
				cwd: 'coffee'
				src: ['*.coffee', 'modules/*.coffee']
				dest: 'htdocs/assets/scripts/compiled'
				ext: '.js'

		removelogging:
			files:
				expand: true
				cwd: 'htdocs/assets/scripts'
				src: ['**/*.js']
				dest: 'htdocs/assets/scripts'
				ext: '.js'

		## Optimize the requirejs project
		requirejs:
			compile:
				options:
					appDir: "htdocs"
					dir: "htdocs-build"
					mainConfigFile: "htdocs/assets/scripts/compiled/config.js"
					baseUrl: "../htdocs/assets/scripts"

		## Optimize images
		imagemin:
			dynamic_mappings:
				options:
					optimizationLevel: 5

				files:[
					expand: true
					cwd: 'htdocs/assets/images'
					src: ['**/*.{png,jpg}']
					dest: 'htdocs/assets/images'
				]

		parallel:
			assetsProd:
				tasks: [
					{
						grunt: true
						args: ['compass:prod']
					},
					{
						grunt: true
						args: ['coffee', 'removelogging']
					},
					{
						grunt: true
						args: ['imagemin']
					}
				]

			assetsDev:
				tasks:[
					{
						grunt: true
						args: ['compass:dist']
					},
					{
						grunt: true
						args: ['coffee']
					}
				]
			



	grunt.loadNpmTasks 'grunt-contrib-compass'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-bower-task'
	grunt.loadNpmTasks 'grunt-contrib-requirejs'
	grunt.loadNpmTasks 'grunt-regarde'
	grunt.loadNpmTasks 'grunt-contrib-livereload'
	grunt.loadNpmTasks 'grunt-notify'
	grunt.loadNpmTasks 'grunt-parallel'
	grunt.loadNpmTasks 'grunt-remove-logging'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'

	grunt.registerTask 'default', ['bower', 'parallel:assetsDev']
	
	grunt.registerTask 'compile', ['parallel:assetsDev']
	grunt.registerTask 'watch', ['parallel:assetsDev', 'livereload-start', 'regarde']
	
	grunt.registerTask 'build', ['parallel:assetsProd', 'requirejs', 'removelogging', 'notify:production']

	grunt.task.run 'notify_hooks'

