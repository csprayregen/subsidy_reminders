class ChildrenController < ApplicationController
  def index
    @children = current_provider.children
    @families = current_provider.families
    render("children/index.html.erb")
  end

  def show
    @child = Child.find(params[:id])
    @guardian = Guardian.new
    @sibling = Child.new
    render("children/show.html.erb")
  end

  def urgent
    @today = Date.today

    future_families = []
    current_provider.families.each do |family|
      family.children.each do |child|
        if child.approved_thru != nil && (child.approved_thru - @today) < 46 && (child.approved_thru - @today) > 0
          future_families.push(family)
        end
      end
    end

    @children = current_provider.children
    @families = future_families.uniq


    render("children/urgent.html.erb")
  end

  def new
    @child = Child.new

    render("children/new.html.erb")
  end

  def create
    @child = Child.new

    @child.last_approval = params[:last_approval]
    @child.approved_thru = params[:approved_thru]
    @child.last_denial = params[:last_denial]
    @child.last_submission = params[:last_submission]
    @child.notes = params[:notes]
    @child.family_id = params[:family_id]
    @child.provider_id = params[:provider_id]
    @child.first_name = params[:first_name]
    @child.last_name = params[:last_name]

    save_status = @child.save

    if save_status == true
      redirect_to("/children/#{@child.id}", :notice => "Child created successfully.")
    else
      render("children/new.html.erb")
    end
  end

  def edit
    @child = Child.find(params[:id])

    render("children/edit.html.erb")
  end

  def update
    @child = Child.find(params[:id])

    @child.last_approval = params[:last_approval]
    @child.approved_thru = params[:approved_thru]
    @child.last_denial = params[:last_denial]
    @child.last_submission = params[:last_submission]
    @child.notes = params[:notes]
    @child.family_id = params[:family_id]
    @child.provider_id = params[:provider_id]
    @child.first_name = params[:first_name]
    @child.last_name = params[:last_name]

    save_status = @child.save

    if save_status == true
      redirect_to("/children/#{@child.id}", :notice => "Child updated successfully.")
    else
      render("children/edit.html.erb")
    end
  end

  def destroy
    @child = Child.find(params[:id])

    @child.destroy

    if URI(request.referer).path == "/children/#{@child.id}"
      redirect_to("/", :notice => "Child deleted.")
    else
      redirect_to(:back, :notice => "Child deleted.")
    end
  end
end
