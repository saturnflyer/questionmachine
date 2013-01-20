require 'format_template'
module FormatResponder
  def self.extended(base)
    base.class_eval {
      include InstanceMethods
    }
  end

  def _response_formats
    @_response_formats ||= []
  end

  def responds(*symbols)
    symbols.each do |sym|
      setup_response_method(sym)
      _response_formats << FormatResponder._format_type(sym)
    end
  end

  private

  def setup_response_method(meth)
    underscored_name = self.name.gsub(/[A-Z]/,'_\0').downcase.sub(/^_/,'')
    define_method(meth){
      FormatTemplate.new("#{underscored_name}.#{meth.to_s.sub(/to_/,'')}").render
    }
  end

  def self._format_type(meth)
    formats_hash = {
      :to_json => 'application/json',
      :to_html => 'text/html'
    }
    content_type = formats_hash.fetch(meth)

    [content_type, meth]
  end

  module InstanceMethods
    def content_types_provided
      self.class._response_formats
    end
  end
end