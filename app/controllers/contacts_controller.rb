class ContactsController < ApplicationController
  def index
    render json: Contact.all
  end

  def create
    contact = Contact.new(contact_params)
    process_request(contact, :save)
  end

  def destroy
    contact = Contact.find(params[:id])
    process_request(contact, :delete)
  end

  def show
    process_request(Contact, :find, params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    process_request(contact, :update, contact_params)
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
