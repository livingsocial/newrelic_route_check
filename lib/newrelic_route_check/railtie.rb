module NewrelicRouteCheck
  class Railtie < Rails::Railtie
    rake_tasks do
      require "newrelic_route_check/tasks"
    end
  end
end
