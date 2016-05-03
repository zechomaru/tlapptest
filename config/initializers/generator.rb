Rails.application.config.generators do |generate|
	generate.helper false
 	generate.javascripts false
 	generate.request_specs false
 	generate.routing_specs false
 	generate.stylesheets false
 	generate.assets false
	generate.test_framework :test_unit, fixture: false
# 	generate.test_framework :minitest, spec: true, fixture: true
# #	generate.views_specs false
end