if ENV['WORKER']
# Sidekiq::Logging.logger.level = Rails.logger.level
  Sidekiq.default_worker_options = {'retry' => 5}

  Sidekiq.configure_server do |config|
    config.redis = {url: ENV["REDIS_URL"]}
  end

  Sidekiq.configure_client do |config|
    config.redis = {url: ENV["REDIS_URL"]}
  end
end