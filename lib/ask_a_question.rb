require 'format_responder'
class AskAQuestion < Webmachine::Resource
  extend FormatResponder

  responds :to_json, :to_html
end