class CompaniesController < ApplicationController
	def index
		@companies=Company.all

	end
	
	def new
		@company=Company.new
	end

	def create
		@companies=Company.new(company_params)
		if @companies.save
			flash[:success] = "Successfully Created!"
			redirect_to companies_path
	    else
	    	flash[:error] = "Sorry! Could not complete the request, please try again!"
           render :action =>'new'
	    end	
	end
    
     def show
     	@company=Company.find(params[:id])
     end 
	def edit
		@company=Company.find(params[:id])
	end

	def update
		@company=Company.find(params[:id])
		if @company.update_attributes(company_params)
			flash[:success] = "Successfully Updated!"
           redirect_to companies_path
		else
			flash[:error] = "Sorry! Could not complete the request, please try again!"
			render :action => 'edit'
		end	
	end

	def destroy
		if Company.find(params[:id]).destroy
            flash[:success] = "Successfully Deleted!"            
			redirect_to companies_path
		else
			flash[:error] = "Sorry! Could not complete the request, please try again!"
		    redirect_to companies_path
		end   	
	end


	private

		def company_params
      		params.require(:company).permit(:name,:address,:register_number)	
   		 end 
end
