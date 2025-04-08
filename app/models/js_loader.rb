class JsLoader
  APP_ROOT = File.expand_path(Dir.pwd) unless defined?(APP_ROOT)
  SCRIPT_DIR = File.join(APP_ROOT, 'scripts') unless defined?(SCRIPT_DIR)

  def initialize
    @script_files = Dir.glob(File.join(SCRIPT_DIR, '**', '*.js'))
  end

  def combine_files
    combined_js = ''
    @script_files.each do |file|
      combined_js << "/* #{file.split('/').last} */\n"
      combined_js << File.read(file)
    end
    combined_js
  end
end