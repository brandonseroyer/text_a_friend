class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @message = Message.new(message_params)
    if message_params[:to].empty?
      Contact.all.each do |contact|
        @message.contacts.push(contact)
      end
    end

    if @message.save
      flash[:notice] = 'Message successfully sent!'
      respond_to do |format|
        format.html
        format.js
      end
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :from, :to)
  end
end
