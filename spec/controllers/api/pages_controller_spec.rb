require 'rails_helper'

RSpec.describe Api::PagesController, type: :controller do
  describe 'GET #index' do
    before do
      @parent_page = create(:page, link_name: 'parent_link', path_name: 'parent_path')
      @child_page = create(:page, link_name: 'child_link', path_name: 'child_path', parent: @parent_page)
      @child2_page = create(:page, link_name: 'child2_link', path_name: 'child2_path', parent: @parent_page)
      @grandchild_page = create(:page, link_name: 'grandchild_link', path_name: 'grandchild_path', parent: @child_page)
    end
    it 'renders the :index view' do
      get :index, as: :json

      expect(response).to be_ok
      response_body = JSON.parse(response.body)
      expect(response_body.keys).to eq(['pages'])
      pages = [
        {
          'id'=>@parent_page.id,
          'link_name'=>'parent_link',
          'full_path'=>'parent_path',
          'children'=>[
            {
              'id'=>@child_page.id,
              'link_name'=>'child_link',
              'full_path'=>'parent_path/child_path',
              'children'=>[{
                'id'=>@grandchild_page.id,
                'link_name'=>'grandchild_link',
                'full_path'=>'parent_path/child_path/grandchild_path',
                'children'=>[]
                }]
            },
            {
              'id'=>@child2_page.id,
              'link_name'=>'child2_link',
              'full_path'=>'parent_path/child2_path',
              'children'=>[]
            }
          ]
        }
      ]
      expect(response_body['pages']).to eq(pages)
    end
  end
end
