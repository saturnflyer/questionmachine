class FormatTemplate
  def initialize(path)
    @path = path
  end

  def render
    file.read
  end

  private

  def file
    File.new(File.expand_path("../templates/#{@path}",__FILE__),'r')
  end
end