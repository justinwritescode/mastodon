# frozen_string_literal: true

def render_static_page(action, dest:, **opts)
  html = ApplicationController.render(action, opts)
  File.write(dest, html)
end

namespace :assets do
  include ActionView::Helpers::AssetTagHelper
  include Webpacker::Helper
  desc 'Generate static pages'
  task generate_static_pages: :environment do
    render_static_page 'errors/400', layout: 'error', dest: Rails.public_path.join('assets', '400.html')
    render_static_page 'errors/401', layout: 'error', dest: Rails.public_path.join('assets', '401.html')
    render_static_page 'errors/403', layout: 'error', dest: Rails.public_path.join('assets', '403.html')
    render_static_page 'errors/404', layout: 'error', dest: Rails.public_path.join('assets', '404.html')
    render_static_page 'errors/406', layout: 'error', dest: Rails.public_path.join('assets', '406.html')
    render_static_page 'errors/409', layout: 'error', dest: Rails.public_path.join('assets', '409.html')
    render_static_page 'errors/410', layout: 'error', dest: Rails.public_path.join('assets', '410.html')
    render_static_page 'errors/418', layout: 'error', dest: Rails.public_path.join('assets', '418.html')
    render_static_page 'errors/422', layout: 'error', dest: Rails.public_path.join('assets', '422.html')
    render_static_page 'errors/429', layout: 'error', dest: Rails.public_path.join('assets', '429.html')
    render_static_page 'errors/500', layout: 'error', dest: Rails.public_path.join('assets', '500.html')
    render_static_page 'errors/502', layout: 'error', dest: Rails.public_path.join('assets', '502.html')
    render_static_page 'errors/503', layout: 'error', dest: Rails.public_path.join('assets', '503.html')
    Rails.public_path.join('packs/google_tag_manager.js').write(Js::GoogleTagManagerController.new.script_content)
    # Rails.public_path.join('packs/identify_user.js').write(Js::AnalyticsIdentifyUserController.new.script_content)
  end
end

if Rake::Task.task_defined?('assets:precompile')
  Rake::Task['assets:precompile'].enhance do
    Webpacker.manifest.refresh
    Rake::Task['assets:generate_static_pages'].invoke
  end
end
