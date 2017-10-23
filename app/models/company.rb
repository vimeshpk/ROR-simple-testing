class Company < ApplicationRecord
	 validates :name, presence: true
	 validates :address, presence: true
	 validates :register_number, presence: true
end
