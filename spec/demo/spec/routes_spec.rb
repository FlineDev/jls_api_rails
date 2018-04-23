require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  it 'loads all categories routes correctly' do
    expect(get: '/api/v1/categories').to route_to(controller: 'api/v1/categories', action: 'index')
    expect(get: '/api/v1/categories/1').not_to be_routable
    expect(post: '/api/v1/categories').not_to be_routable
    expect(patch: '/api/v1/categories/1').not_to be_routable
    expect(put: '/api/v1/categories/1').not_to be_routable
    expect(delete: '/api/v1/categories/1').not_to be_routable
  end

  it 'loads all challenges routes correctly' do
    expect(get: '/api/v1/challenges').to route_to(controller: 'api/v1/challenges', action: 'index')
    expect(get: '/api/v1/challenges/1').to route_to(controller: 'api/v1/challenges', action: 'show', id: '1')
    expect(post: '/api/v1/challenges').to route_to(controller: 'api/v1/challenges', action: 'create')
    expect(patch: '/api/v1/challenges/1').to route_to(controller: 'api/v1/challenges', action: 'update', id: '1')
    expect(put: '/api/v1/challenges/1').to route_to(controller: 'api/v1/challenges', action: 'update', id: '1')
    expect(delete: '/api/v1/challenges/1').to route_to(controller: 'api/v1/challenges', action: 'destroy', id: '1')
  end

  it 'loads all users routes correctly' do
    expect(get: '/api/v1/users').to route_to(controller: 'api/v1/users', action: 'index')
    expect(get: '/api/v1/users/1').to route_to(controller: 'api/v1/users', action: 'show', id: '1')
    expect(post: '/api/v1/users').to route_to(controller: 'api/v1/users', action: 'create')
    expect(patch: '/api/v1/users/1').to route_to(controller: 'api/v1/users', action: 'update', id: '1')
    expect(put: '/api/v1/users/1').to route_to(controller: 'api/v1/users', action: 'update', id: '1')
    expect(delete: '/api/v1/users/1').to route_to(controller: 'api/v1/users', action: 'destroy', id: '1')
  end
end
