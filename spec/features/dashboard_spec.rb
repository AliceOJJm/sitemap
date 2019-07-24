require 'spec_helper'

feature "Visit Dashboard" do
  before do
    parent_page = create(:page, link_name: 'Parent link', path_name: 'parent_path')
    child_page = create(:page, link_name: 'Child link', path_name: 'child_path', parent: parent_page)
    create(:page, link_name: 'Child 2 link', path_name: 'child2_path', parent: parent_page)
    create(:page, link_name: 'Grandchild link', path_name: 'grandchild_path', parent: child_page)
  end

  scenario "Able to see text Sitemap", js: true do
    visit('/')
    expect(page).to have_link('Parent link', href: 'parent_path', id: 'parent_link')
    expect(page).to have_link('Child link', href: 'parent_path/child_path', id: 'parent_link.child_link')
    expect(page).to have_link('Child 2 link', href: 'parent_path/child2_path', id: 'parent_link.child_2_link')
    expect(page).to have_link('Grandchild link', href: 'parent_path/child_path/grandchild_path', id: 'parent_link.child_link.grandchild_link')
  end
end
