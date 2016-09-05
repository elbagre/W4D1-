class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @user.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.new(params[:id])
    if @contact.destroy
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    render json: Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update!(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end 


  private

  def contact_params
    params = params.require(:contact).permit(:name, :email, :user_id)
  end
end
