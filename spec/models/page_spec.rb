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

require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:parent_page) { create(:page, link_name: 'parent_link', path_name: 'parent_path') }
  let(:child_page) { create(:page, link_name: 'child_link', path_name: 'child_path', parent: parent_page) }
  let(:grandchild_page) { create(:page, link_name: 'grandchild_link', path_name: 'grandchild_path', parent: child_page) }
  let(:page) { build(:page, link_name: 'link', path_name: 'path', parent: parent_page) }

  describe 'create callbacks' do
    it 'triggers init_full_path before create' do
      expect(page).to receive(:init_full_path)
      page.save
    end

    it 'inherits parent path' do
      page.save
      expect(page.full_path).to eq('parent_path/path')
    end
  end

  describe 'update' do
    it 'triggers set_full_path before update if path_name changed' do
      expect(parent_page).to receive(:set_full_path)
      parent_page.update(path_name: 'new_parent_path')
    end

    it 'does not trigger set_full_path before update if only path_name did not change' do
      expect(parent_page).to_not receive(:set_full_path)
      parent_page.update(link_name: 'new_parent_link')
    end

    it 'changes descendants full path' do
      parent_page.update(path_name: 'newest_parent_path')
      expect(child_page.full_path).to eq('newest_parent_path/child_path')
      expect(grandchild_page.full_path).to eq('newest_parent_path/child_path/grandchild_path')
    end
  end
end
