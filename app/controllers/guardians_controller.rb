class GuardiansController < ApplicationController
  def index
    @guardians = Guardian.all

    render("guardians/index.html.erb")
  end

  def show
    @guardian = Guardian.find(params[:id])

    render("guardians/show.html.erb")
  end

  def new
    @guardian = Guardian.new

    render("guardians/new.html.erb")
  end

  def create
    @guardian = Guardian.new

    @guardian.first_name = params[:first_name]
    @guardian.last_name = params[:last_name]
    @guardian.family_id = params[:family_id]

    save_status = @guardian.save

    if save_status == true
      redirect_to("/guardians/#{@guardian.id}", :notice => "Guardian created successfully.")
    else
      render("guardians/new.html.erb")
    end
  end

  def edit
    @guardian = Guardian.find(params[:id])

    render("guardians/edit.html.erb")
  end

  def update
    @guardian = Guardian.find(params[:id])

    @guardian.first_name = params[:first_name]
    @guardian.last_name = params[:last_name]
    @guardian.family_id = params[:family_id]

    save_status = @guardian.save

    if save_status == true
      redirect_to("/guardians/#{@guardian.id}", :notice => "Guardian updated successfully.")
    else
      render("guardians/edit.html.erb")
    end
  end

  def destroy
    @guardian = Guardian.find(params[:id])

    @guardian.destroy

    if URI(request.referer).path == "/guardians/#{@guardian.id}"
      redirect_to("/", :notice => "Guardian deleted.")
    else
      redirect_to(:back, :notice => "Guardian deleted.")
    end
  end
end
