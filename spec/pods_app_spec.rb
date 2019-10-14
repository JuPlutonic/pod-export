require 'rails_helper'

# Capybara.current_driver = :selenium
Capybara.default_driver = :poltergeist
Capybara.use_default_driver

Capybara.app_host = 'http://localhost:3000'

describe 'pods App' do
  # testval = text_in_dirs('./app', 'NNNNNNNN')
  # expect(testval).to be > 0
end

def text_in_dirs(file_path, text)
  dcount = 0
  # Dir.chdir(file_path)
  Dir["#{file_path}/**/*.rb"].each do |fname|
    dcount += text_in_file(fname, text)
  end
  dcount
end

def text_in_file(file_name, text)
  count = 0
  file = File.open(file_name, 'r')
  file.each_line do |line|
    count += 1 if line.include? text
  end
  count
end
