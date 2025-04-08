class CssLoader
  APP_ROOT = File.expand_path(Dir.pwd) unless defined?(APP_ROOT)
  STYLES_DIR = File.join(APP_ROOT, 'styles') unless defined?(STYLES_DIR)

  def initialize
    @style_files = Dir.glob(File.join(STYLES_DIR, '**', '*.css'))
  end

  def combine_files
    combined_css = ''
    @style_files.each do |file|
      combined_css << "/* #{file.split('/').last} */\n"
      combined_css << File.read(file)
    end
    combined_css
  end
end