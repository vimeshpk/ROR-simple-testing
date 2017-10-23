require 'test_helper'

class HomeRoutesControllerTest < ActionDispatch::IntegrationTest
test "routes" do
    	assert_generates "/", controller: "companies", action: "index"
	end
end
