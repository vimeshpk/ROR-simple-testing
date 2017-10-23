require 'test_helper'

class CompaniesTest < ActionDispatch::IntegrationTest
 test "can create an company" do
	  get "/companies/new"
	  assert_response :success
	  post "/companies",
	    params: { company: { name: "MINDSTACK", address: "NITK STEP", register_number: '0123456678' } }
	  assert_response :redirect
	  follow_redirect!
  	assert_response :success
  end
  test "can update an company" do
  	get "/companies/#{companies(:one).id}/edit"
  	assert_response :success
  	patch "/companies/#{companies(:one).id}",
	    params: { company: { name: "MINDSTACK", address: "NITK STEP", register_number: '0123456678' } }
	  assert_response :redirect
	  follow_redirect!
  	  assert_response :success
  end	
end
