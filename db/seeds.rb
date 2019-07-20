# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

home_page = Page.create(link_name: 'Home', path_name: '/')
settings_page = Page.create(link_name: 'Settings', path_name: 'settings', parent: home_page)
Page.create(link_name: 'Company Profile', path_name: 'company_profile', parent: settings_page)
Page.create(link_name: 'Switches', path_name: 'switches', parent: settings_page)
help_page = Page.create(link_name: 'Help', path_name: 'help', parent: home_page)
tickets_page = Page.create(link_name: 'Tickets', path_name: 'tickets', parent: help_page)
Page.create(link_name: 'Create A Ticket', path_name: 'create', parent: tickets_page)
Page.create(link_name: 'FAQ', path_name: 'faqs', parent: help_page)
