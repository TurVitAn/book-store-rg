require 'simplecov'

SimpleCov.start 'rails' do
  minimum_coverage 95
  add_filter %w[app/models app/helpers app/channels app/jobs app/mailers]
end
