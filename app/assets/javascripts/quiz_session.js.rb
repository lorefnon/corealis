require_relative './application'
require 'clearwater'

router = Clearwater::Router.new do
  route 'question'
end

Clearwater::Application.new(
  component: QuizSession::Components::Root.new,
  router: router
)
