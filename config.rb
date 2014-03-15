# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# Set this to the root of your project when deployed:
http_path = "/"
sass_dir = "sass"

path_prefix = "htdocs/"

css_dir = "assets/stylesheets/compiled"
css_path = path_prefix + css_dir

images_dir = "assets/images"
images_path = path_prefix + images_dir

javascripts_dir = "assets/scripts"
javascripts_path = path_prefix + javascripts_dir

fonts_dir = "assets/fonts"
fonts_path = path_prefix + fonts_dir

generated_images_dir = images_dir + '/generated'
generated_images_path = path_prefix + generated_images_dir
http_generated_images_path = http_path + generated_images_dir

sprite_load_path = [images_path, images_path + '/sprites']

sass_options = (environment == :production) ? { :quiet => true } : { :debug_info => true }
disable_warnings = (environment == :production) ? true : false 

extentions_dir = 'components'

# Require any additional compass plugins here.

