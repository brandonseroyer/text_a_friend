class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = 'Contact successfully saved!'
      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :number)
  end
end
