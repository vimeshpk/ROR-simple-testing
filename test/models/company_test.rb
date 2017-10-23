require File.dirname(__FILE__) + '/../test_helper'
class CompanyTest < ActiveSupport::TestCase
fixtures :companies
  test "should not save company without name" do
  	company = Company.new
  	assert_not company.save, "Saved the company without a name"
  end
  test "create company details" do
  	company = Company.new :name => companies(:one).name,
    :address => companies(:one).address,
    :register_number => companies(:one).register_number
    assert company.save,"Save company"
  end
   test "update company details" do
  	company = Company.find(companies(:one).id) 
  	company.name="testing"
    assert company.update_attributes(:name =>"hi"),"update company"
  end
  test "delete company details" do
  	company = Company.find(companies(:one).id) 
  	assert company.destroy,"Destroy"
  end
end
