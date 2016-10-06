class MessagesController < ApplicationController
  def index
    @messages = Message.with_users.all.order('random()')
  end
end
