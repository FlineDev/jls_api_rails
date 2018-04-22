require 'spec_helper'

RSpec.describe 'Routes' do
  it 'loads routes within directory' do
    JlsApi::Routes.instance.load_routes(version: 'v1', base_directory: "spec/demo/app/api", )

    resulting_routes = JlsApi::Routes.instance.routes['v1']

    expect(resulting_routes.keys.count).to eq 3
    expect(resulting_routes.keys).to include('categories', 'challenges', 'users')

    expect(resulting_routes['categories']).to match_json_expression({
      'actions': ['index'],
      'index': {
        'paginatable': false
      }
    })

    expect(resulting_routes['challenges']).to match_json_expression({
      'actions': ['index', 'create', 'show', 'update', 'destroy'],
      'index': {
        'paginatable': true,
        'filterable': ['title', 'endTime', 'type', 'category.identifier'],
        'sortable': ['title', 'endTime', 'type', 'category.identifier'],
        'includable': ['category']
      },
      'create': { 'includable': ['category'] },
      'show': { 'includable': ['category'] },
      'update': { 'includable': ['category'] },
      'destroy': { 'includable': ['category'] }
    })

    expect(resulting_routes['users']).to match_json_expression({
      'actions': ['index', 'create', 'show', 'update', 'destroy'],
      'index': {
        'paginatable': true,
        'filterable': ['nickname', 'email'],
        'sortable': ['nickname']
      },
      'create': {},
      'show': {},
      'update': {},
      'destroy': {}
    })
  end
end
