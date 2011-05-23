class PatientsController < ApplicationController
  def new
    @title="mode new"
    @patient = Patient.new
  end

  def create
    @title="mode create"
    @patient = Patient.new(params[:patient])
     print("\n_______________\n")
   print(@patient.id) 
    print("\n_______________\n") 
       if(! @patient.save)
      render 'new'
    end
    
    print("\n_______________\n")
   print(@patient.id) 
    print("\n_______________\n")    
    render 'show'
  end

  def update
    @title="mode update"
    @patient = Patient.new(params[:patient])
    if(! @patient.save)
      render 'edit'
    end
  end

  def destroy
    
    print("\n\n\n\n\n j'arrive dans destroy\n")
    @title="mode destroy"
    @patient = Patient.find(params[:id]) 
    @patient.delete 
    
    index #TODO : Audric : Est-ce qu'on fait ça ou est-ce qu'on dit qu'on met des "render 'aaa' dans def aaa ? "
    render 'index' # FIXME : Audric : Comprendre pourquoi cette méthode est mauvaise : le :id reste dans params et ça fout une grosse merde ...
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
