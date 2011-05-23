class PatientsController < ApplicationController
  def new
    @title="mode new"
    @patient = Patient.new
  end

  def create
    @title="mode create"
    @patient = Patient.new(params[:patient])
    if(! @patient.save)
        render 'new'
    else 
       redirect_to(@patient)
    end
  end

  def update
    @title="mode update"
    @patient = Patient.new(params[:patient])
    if(! @patient.save)
      render 'edit'
    end
  end

  def destroy
    @title="mode destroy"
    @patient = Patient.find(params[:id]) 
    @patient.delete 
    
    redirect_to patients_path # FIXME : Audric : FIXED :)
  end

  def edit
    @title="mode edit"
    @patient = Patient.find(params[:id])
  end

  def show
    @title="mode show"
    @patient = Patient.find(params[:id])
  end

  def index
    @title = "mode all"
    @patients = Patient.paginate :page => params[:page] , :per_page => 1
  end

end
