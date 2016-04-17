class QuizSessionChannel < ApplicationCable::Channel

  def subscribed
    puts "Subscribed"
  end

  def unsubscribed
    puts "Unsubscribed"
  end

  def update_answer(patch_set)
    puts "Updating answer ==> #{patch_set}"
  end

end
