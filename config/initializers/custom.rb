Rails.application.config.assets.paths << Rails.root.join('app','assets','fonts')
Rails.application.config.assets.precompile += %w(.svg.eot.woff.ttf)
#Rails.application.config.assets.precompile += %w(.jpg.png.gif.svg)

# Rails.application.config.assets.precompile += ['application.css','home.scss','bootstrap.css',
# 	"fonts/font-awesome.min.css", "dashboard/AdminLTE.min.css","dashboard/skin-red.min.css",
# 'admin/login.css', "dashboard/custom.css"]

Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/images/gal_del.png )
Rails.application.config.assets.precompile += %w(home.css)
Rails.application.config.assets.precompile += %w(login.css)
# Rails.application.config.assets.precompile += ['application.js',
#  'jquery.min.js','bootstrap.min.js','isotope.js',
# 'home.js','dashboard/app.min.js']