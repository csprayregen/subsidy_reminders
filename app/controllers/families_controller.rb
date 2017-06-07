class FamiliesController < ApplicationController

  def index
    @families = Family.all

    render("families/index.html.erb")
  end

  def show
    @family = Family.find(params[:id])
    @child = Child.new
    @guardian = Guardian.new

    render("families/show.html.erb")
  end

  def new
    @family = Family.new

    render("families/new.html.erb")
  end

  def create
    @family = Family.new

    @family.provider_id = params[:provider_id]
    @family.name = params[:name]
    save_status = @family.save

    if save_status == true
      redirect_to("/families/#{@family.id}", :notice => "Family created successfully.")
    else
      render("families/new.html.erb")
    end
  end

  def edit
    @family = Family.find(params[:id])

    render("families/edit.html.erb")
  end

  def update
    @family = Family.find(params[:id])

    @family.provider_id = params[:provider_id]
    @family.name = params[:name]
    save_status = @family.save

    if save_status == true
      redirect_to("/families/#{@family.id}", :notice => "Family updated successfully.")
    else
      render("families/edit.html.erb")
    end
  end

  def destroy
    @family = Family.find(params[:id])

    @family.destroy

    if URI(request.referer).path == "/families/#{@family.id}"
      redirect_to("/", :notice => "Family deleted.")
    else
      redirect_to(:back, :notice => "Family deleted.")
    end
  end
end
