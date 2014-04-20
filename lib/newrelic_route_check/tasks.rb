namespace :newrelic do

  desc "compare routes with recent new relic usage"
  task :compare_with_routes  => :environment do
    file = 'tmp/controller_summary.csv'
    unless File.exist?(file)
      raise "You must have #{file} to run this task please export that csv from new relic (web transactions -> table view -> last 7 days -> export as csv)"
    end

    new_relic_controller_actions = NewrelicRouteCheck.actions_from_new_relic(file)
    formatted_routes_actions = NewrelicRouteCheck.actions_from_routes
    NewrelicRouteCheck.routes_diff_output(new_relic_controller_actions, formatted_routes_actions)
  end 

end
