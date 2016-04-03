require 'test_helper'

class PvSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pv_site = pv_sites(:one)
  end

  test "should get index" do
    get pv_sites_url
    assert_response :success
  end

  test "should create pv_site" do
    assert_difference('PvSite.count') do
      post pv_sites_url, params: { pv_site: { direction: @pv_site.direction, label: @pv_site.label, location: @pv_site.location, max_production: @pv_site.max_production } }
    end

    assert_response 201
  end

  test "should show pv_site" do
    get pv_site_url(@pv_site)
    assert_response :success
  end

  test "should update pv_site" do
    patch pv_site_url(@pv_site), params: { pv_site: { direction: @pv_site.direction, label: @pv_site.label, location: @pv_site.location, max_production: @pv_site.max_production } }
    assert_response 200
  end

  test "should destroy pv_site" do
    assert_difference('PvSite.count', -1) do
      delete pv_site_url(@pv_site)
    end

    assert_response 204
  end
end
