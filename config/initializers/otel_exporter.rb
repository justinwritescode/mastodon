# frozen_string_literal: true

require 'opentelemetry-sdk'
require 'opentelemetry/exporter/otlp'

# Replace this with your Application Insights Instrumentation Key.
application_insights_instrumentation_key = ENV.fetch('APPLICATIONINSIGHTS_INSTRUMENTATION_KEY', nil)

if application_insights_instrumentation_key
  # Configure the OTLP Exporter
  OpenTelemetry::SDK.configure do |c|
    c.use_all # Enables all instrumentation

    # Setup the OTLP Exporter
    c.add_span_processor(
      OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
        OpenTelemetry::Exporter::OTLP::Exporter.new(
          endpoint: 'https://dc.services.visualstudio.com/v2/track',
          headers: { 'api-key' => application_insights_instrumentation_key }
        )
      )
    )
  end
else
  Rails.logger.warn('APPLICATIONINSIGHTS_INSTRUMENTATION_KEY is not set. Skipping OpenTelemetry configuration.')
end
