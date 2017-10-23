require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
 test "creating an company" do
	  visit companies_path
	 
	  click_on "New Company"
	 
	  fill_in "name", with: "mindstack"
	  fill_in "address", with: "NITK STEP!"
	  fill_in "register_number", with: "123456789"
	  click_on "Create Company"
	 
	  assert_text "Company Details"
	end
end
