class ContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @contacts = @user.contacts
  end

  def new
    @contact = Contact.new
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.find(contact_params[:user_id])
    @contact = @user.contacts.new(contact_params)
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

  def edit
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to user_contact_path(@user, @contact)
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to user_contacts_path(params[:user_id])
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :number, :user_id)
  end
end
