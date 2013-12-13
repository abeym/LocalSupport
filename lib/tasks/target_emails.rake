# rake db:target_emails
require 'csv'
namespace :db do
  task :target_emails => :environment do
    orgs = Organization.find_orphan_organizations
    CSV.open("db/target_emails.csv", "wb") do |csv|
      orgs.each { |org| csv << [org.name, org.email] }
    end
  end
end
