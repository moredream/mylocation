require 'test_helper'

class ListLocationTest < ActionDispatch::IntegrationTest

  setup {host! 'api.mylocation-dev.com'}

  test 'return all locations' do
    get '/locations'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'return locations filtered by type' do
    orchard = Location.create!(name: 'orchard', note:'shopping')
    changi = Location.create!(name: 'changi', note:'airport')

    get '/locations?note=shopping'
    assert_equal 200, response.status

    locations = JSON.parse(response.body, symbolize_names: true)
    names = locations.collect{ |loc| loc[:name]}

    assert_includes names, 'orchard'
    refute_includes names, 'changi'
  end

end
