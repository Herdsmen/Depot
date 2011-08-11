class ActsAsRateableUpdate1Generator < Rails::Generator::Base 
  def manifest 
    record do |m| 
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "acts_as_rateable_update1"
    end 
  end
end
