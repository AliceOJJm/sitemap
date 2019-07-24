# == Schema Information
#
# Table name: pages
#
#  id        :bigint(8)        not null, primary key
#  link_name :string
#  path_name :string
#  full_path :string
#  ancestry  :string
#

FactoryBot.define do
  factory :page do
    link_name {Faker::Lorem.characters(10)}
    path_name {Faker::Lorem.characters(10)}
  end
end
