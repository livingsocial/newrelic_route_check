require "newrelic_route_check/version"

module NewrelicRouteCheck
  
  def self.actions_from_routes
    controller_actions = Rails::Application.routes.routes.inject({}) do |controller_actions, route|
      if route.requirements[:controller]
        (controller_actions[route.requirements[:controller]] ||= []) << route.requirements[:action]
      end
      controller_actions
    end
    controller_actions.keys.map{|controller| controller_actions[controller].map{|action| "#{controller.camelize}Controller##{action}"}}.flatten.uniq 
  end

  def self.actions_from_new_relic(file)
    new_relic_controller_actions = []
    CSV.foreach(file, :col_sep => ",") do |row|
      if row.first && !['HttpDispatcher','Action'].include?(row.first.chomp) && !row.first.chomp.include?('#(template only)')
        new_relic_controller_actions << row.first.chomp
      end
    end
    new_relic_controller_actions.uniq
  end

  def self.routes_diff_output(new_relic_controller_actions, formatted_routes_actions)
    puts "found #{new_relic_controller_actions.length} uniq new relic controller action hits"
    puts "found #{formatted_routes_actions.length} uniq controller action pairs"

    only_new_relic = new_relic_controller_actions - formatted_routes_actions
    puts "exists in new relic, but not in routes: #{only_new_relic.length}"  
    puts only_new_relic 

    not_hit_in_new_relic = formatted_routes_actions - new_relic_controller_actions
    puts "never accessed in new relic stats: #{not_hit_in_new_relic.length}"
    puts not_hit_in_new_relic
  end

end
