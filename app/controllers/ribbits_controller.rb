class RibbitsController < ApplicationController

	

  def create
       @ribbit = Ribbit.new(params[:ribbit])
       @ribbit.userid = current_user.id
 
       if @ribbit.save
          redirect_to current_user 
       else
          flash[:error] = "Problem!"
           redirect_to current_user
       end
   end

   def new
    @ribbit = Ribbit.new
  end

  def show
    @ribbit = Ribbit.find(params[:id])
    @ribbit = Ribbit.new
  end


  def edit
    
  end

  def destroy
    
  end

  private

  def ribbit_params
           params.require(:ribbit).permit(:context, :userid)
    end
end
