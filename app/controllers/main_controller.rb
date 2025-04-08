class MainController < Rubee::BaseController
  APP_ROOT = File.expand_path(Dir.pwd) unless defined?(APP_ROOT)
  STYLES_DIR = File.join(APP_ROOT, 'styles') unless defined?(STYLES_DIR)
  SCRIPT_DIR = File.join(APP_ROOT, 'script') unless defined?(SCRIPT_DIR)
  def style
    req_path = @request.path.sub('/styles/', '')
    styles_path = File.join(STYLES_DIR, req_path)

    if req_path == 'application.css'
      # Load all CSS files in the styles directory
      loader = CssLoader.new

      combined_css = loader.combine_files
      mime_type = Rack::Mime.mime_type(File.extname(styles_path))
      response_with object: combined_css, type: :image, mime_type: mime_type
      
    elsif File.exist?(styles_path) && File.file?(styles_path)
      mime_type = Rack::Mime.mime_type('.css')
      response_with object: File.read(styles_path), type: :image, mime_type: mime_type
    else
      response_with object: "Styles not found", type: :text
    end
  end

  def script
    req_path = @request.path.sub('/scripts/', '')
    scripts_path = File.join(SCRIPT_DIR, req_path)

    if req_path == 'application.js'
      # Load all CSS files in the scripts directory
      loader = JsLoader.new

      combined_js = loader.combine_files
      mime_type = Rack::Mime.mime_type('.js')
      response_with object: combined_js, type: :image, mime_type: mime_type
      
    elsif File.exist?(scripts_path) && File.file?(scripts_path)
      mime_type = Rack::Mime.mime_type(File.extname(scripts_path))
      response_with object: File.read(scripts_path), type: :image, mime_type: mime_type
    else
      response_with object: "scripts not found", type: :text
    end
  end
end