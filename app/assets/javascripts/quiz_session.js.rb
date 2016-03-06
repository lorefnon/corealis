require_relative './application'
require 'clearwater'
require 'trix'

router = Clearwater::Router.new do
  route 'question'
end

Clearwater::Application.new(
  component: QuizSession::Components::Root.new,
  router: router
)
