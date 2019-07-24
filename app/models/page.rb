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

class Page < ApplicationRecord
  has_ancestry

  validates :link_name, presence: true
  validates :path_name, presence: true, uniqueness: true

  before_create :init_full_path
  before_update :set_full_path, if: :will_save_change_to_path_name?
  after_update :update_descendants, if: :saved_change_to_full_path?

  protected

  def set_full_path
    self.full_path = "#{parent&.full_path}#{'/' if parent.present?}#{path_name}".gsub('//', '/')
  end

  private

  def init_full_path
    self.full_path = ancestors.pluck('path_name').push(path_name).join('/').gsub('//', '/')
  end

  def update_descendants
    descendants.each do |descendant|
      descendant.set_full_path
      descendant.save
    end
  end
end
