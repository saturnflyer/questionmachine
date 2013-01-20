require 'webmachine'

require 'ask_a_question'

AskTheExperts = Webmachine::Application.new do |app|
  app.routes do
    add ['*'], AskAQuestion
  end
end

AskTheExperts.run