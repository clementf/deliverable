# frozen_string_literal: true
require 'rails/generators'
require 'rails/generators/active_record'

module Deliverable
  #
  # Rails generator used for setting up Deliverable in a Rails application.
  # Run it with +bin/rails g deliverable:install+ in your console.
  #
  class InstallGenerator < Rails::Generators::Base
    include ActiveRecord::Generators::Migration

    source_paths << File.join(File.dirname(__FILE__), "templates/install")

    def create_migration_file
      migration_template 'migrations/create_deliverable_tables.rb.erb', File.join(db_migrate_path, "create_deliverable_tables.rb")
    end

    private

    def migration_version
      "[#{ActiveRecord::VERSION::STRING.to_f}]"
    end
  end
end

