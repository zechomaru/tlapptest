# sThis file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#  user = User.find_by_email 'gen.reyest@gmail.com'
# user.github_user = 'greyes193'
# user.save
# 
# #######################
# 	Freelances roles		#
# #######################
if !(FRole.find_by_name 'Diseñador' and FRole.find_by_name 'Redactor')
	["Diseñador","Redactor"].each do |fRole|
		FRole.create!(name: fRole)
	end
end
# #######################
# 	Freelances Levels		#
# #######################
if !(Level.find_by_name 'noob' and Level.find_by_name 'leve1')
	["noob","level1"].each do |level|
		Level.create!(name: level)
	end
end
# ###########################
# 	Administradores roles		#
# ###########################
if !(Role.find_by_name 'Super' and Role.find_by_name 'Admin')
	["Super","Admin"].each do |admRole|
		Role.create!(name: admRole)
	end
end
# #######################
# 	Administradores			#
# #######################
if !Admin.find_by_email 'xavier@trely.co'
	a = Role.find_by_name 'Super'
	Admin.create!(
		email: 'xavier@trely.co', 
		password: 'password', 
		password_confirmation: 'password', 
		name: "Xavier",
		last_name: "Gonzalez",
		country: "Venezuela",
		city: "Caracas",
		phone: "04143165636",
		gender: "Masculino",
		avatar: File.new("#{Rails.root}/app/assets/images/xavier.jpg"),
		role_id: a.id)
end
# ###########################
# 	Categoria Servicio			#
# ###########################
if !(Category.find_by_name 'Diseño' and Category.find_by_name 'Redacción')
	["Diseño","Redacción"].each do |category|
		Category.create!(name: category.capitalize)
	end
end
# #########################
# 	servicios Diseño			#
# #########################
i = 0
["DISEÑADORES & CREATIVOS",
	"DISEÑADORES DE SOCIAL MEDIA",
	"DISEÑO DE INFOGRAFIA",
	"ADAPTACION DE UN DISEÑO"].each do |service|
	a = Category.find_by_name 'Diseño'
	name = service

	if name['Ñ']
			name['Ñ'] = 'ñ'
		end
	if !Service.find_by_name name.capitalize

		img = ['botones_activos-03.png',
		 'botones_activos-07.png',
		  'botones_activos-06.png',
		  'botones_activos-05.png']
		imghover = ['botones_hover-03.png',
		 'botones_hover-07.png',
		 'botones_hover-06.png',
		 'botones_hover-05.png']
		Service.create!(name: name.capitalize,
		img: File.new("#{Rails.root}/app/assets/images/#{img[i]}"),
		imghover: File.new("#{Rails.root}/app/assets/images/#{imghover[i]}"),
		category_id: a.id)
		i += 1
	end
end
# ###########################
# 	servicios Redaccion			#
# ###########################
i = 0
["REDACCION",
	"COMMUNITY MANAGERS"].each do |service|
	a = Category.find_by_name 'Redacción'
	if !Service.find_by_name service
		img = ['botones_activos-08.png',
		 'botones_activos-01.png']
		imghover = ['botones_hover-08.png',
			'botones_hover-01.png']
		Service.create!(name: service.capitalize,
		img: File.new("#{Rails.root}/app/assets/images/#{img[i]}"),
		imghover: File.new("#{Rails.root}/app/assets/images/#{imghover[i]}"),
		category_id: a.id)
		i += 1
	end
end
# ##############
# 	Paquetes	 #
# ##############
i = 0
["WEB DEVELOPERS",
	"MOBILE DEVELOPERS"].each do |bundle|
	if !Bundle.find_by_name bundle.capitalize
		img = ['botones_activos-04.png','botones_activos-02.png']
		imghover = ['botones_hover-04.png','botones_hover-02.png']
		Bundle.create!(name: bundle.capitalize,
		img: File.new("#{Rails.root}/app/assets/images/#{img[i]}"),
		imghover: File.new("#{Rails.root}/app/assets/images/#{imghover[i]}"))
		i += 1
	end
end
# ##########################
# 	Paginas de servicios	 #
# ##########################
["DISEÑADORES & CREATIVOS",
	"DISEÑADORES DE SOCIAL MEDIA",
	"DISEÑO DE INFOGRAFIA",
	"ADAPTACION DE UN DISEÑO",
	"REDACCION",
	"COMMUNITY MANAGERS"].each do |page|
		if page['Ñ']
			page['Ñ'] = 'ñ'
		end
	url = page.gsub(/,*\s+/,'-').downcase!
	a = Service.find_by_name page.capitalize
		
	if !Page.find_by_url url
		Page.create!(url: url,
	 title: page,
	 subtitle: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium, quos fugiat soluta! Nostrum labore atque consequuntur culpa vero non.",
	 visibility: true,
	 service_id: a.id)
	end
end

# ##########################
# 	Paginas de Paquetes 	 #
# ##########################
["WEB DEVELOPERS",
	"MOBILE DEVELOPERS"].each do |page|
	a = Bundle.find_by_name page.capitalize
	url = page.gsub(/,*\s+/,'-').downcase!
	if !Page.find_by_url url
		Page.create!(url: url,
	 title: page,
	 subtitle: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium, quos fugiat soluta! Nostrum labore atque consequuntur culpa vero non.",
	 visibility: true,
	 bundle_id: a.id)
	end
end


# #######################
# 	Status ORders				#
# #######################
if !(StatusOrder.find_by_name 'Pendiente' and StatusOrder.find_by_name 'Aceptado' and StatusOrder.find_by_name 'Entregado')
	["Pendiente","Aceptado","Entregado"].each do |status|
		StatusOrder.create!(name: status)
	end
end

puts '*** ¡listo la carga de datos! ***'

 