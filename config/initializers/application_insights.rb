# require 'opentelemetry/sdk'
# require 'opentelemetry/instrumentation/all'
# require 'opentelemetry/exporter/application_insights'

# # Configure OpenTelemetry SDK
# OpenTelemetry::SDK.configure do |config|
#   # Specify the service name and version
#   service_name = Rails.application.class.module_parent_name
#   service_version = Rails.root.join('REVISION').exist? ? Rails.root.join('REVISION').read : 'unknown'

#   config.service_name = service_name
#   config.service_version = service_version

#   # Configure the Application Insights exporter
#   config.use_all 'OpenTelemetry::Exporter::ApplicationInsights' => {
#     instrumentation_key: ENV.fetch('APPLICATION_INSIGHTS_INSTRUMENTATION_KEY', nil),
#     endpoint: ENV.fetch('APPLICATION_INSIGHTS_ENDPOINT', nil),
#   }

#   # Optionally configure other OpenTelemetry components like propagators and samplers here
# end
