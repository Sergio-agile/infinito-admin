# frozen_string_literal: true

if Rails.env.development? && ENV['RACK_PROFILER'] == 'true'
  require "rack-mini-profiler"

  # The initializer was required late, so initialize it manually.
  Rack::MiniProfiler.config.position = 'bottom-right'
  Rack::MiniProfiler.config.enable_hotwire_turbo_drive_support = true
  Rack::MiniProfiler.config.show_total_sql_count = true
  Rack::MiniProfilerRails.initialize!(Rails.application)
end
