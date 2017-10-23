require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
	# called before every single test
  	setup do
    	@company = companies(:one)
  	end
 
  	# called after every single test
  	teardown do
    	# when controller is using cache it may be a good idea to reset it afterwards
    	Rails.cache.clear
  	end
  	test "should get index" do
    	get companies_url
    	assert_response :success
  	end
  	test "should create company" do
  		assert_difference('Company.count') do
    		post companies_url, params: { company: { name: 'Mindstack', address: 'NITK STEP', register_number: '0123456678' } }
  		end
 
  		 assert_redirected_to companies_path
  		 assert_equal 'Successfully Created!', flash[:success]
   	end
   	test "should show company" do
    	# Reuse the @company instance variable from setup
    	get company_url(@company)
    	assert_response :success
  	end
 	test "should update company" do
    	patch company_url(@company), params: { company: { name: 'Mindstack', address: 'NITK STEP', register_number: '0123456678' } }
  		assert_redirected_to companies_path
  		assert_equal 'Successfully Updated!', flash[:success]
   	end
   	test "should destroy company" do
	    assert_difference('Company.count', -1) do
	      delete company_url(@company)
	    end
	    assert_redirected_to companies_path
	    assert_equal 'Successfully Deleted!', flash[:success]
  	end
    test "view test" do
    	get companies_url
    	assert_select "ol" do
  		assert_select "li", 7
		end
    end	

    test "routes" do
    	assert_generates "/", controller: "companies", action: "index"
	end
end
