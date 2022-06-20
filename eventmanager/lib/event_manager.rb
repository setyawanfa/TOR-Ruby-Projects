require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'


puts 'Event Manager Initialized!'

def clean_zipcode(zipcode)
  if zipcode.nil?
    '00000'
  elsif zipcode.length < 5
    zipcode.rjust(5,'0')
  elsif zipcode.length > 5
    zipcode[0..4]
  else
    zipcode
  end
end

def legisator_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  
  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperbody','legislatorLowerBody']
    ).officials
   # legislators = legislators.officials
   # legislators_names = legislators.map(&:name)
   # legislators_names.join(", ")
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legisator_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  Dir.mkdir('output') unless Dir.exist?('output')
  filename = "output/thanks_#{id}.html"                              
  File.open(filename,'w') do |file|
    file.puts form_letter
  end
  # puts "#{name} #{zipcode} #{legislators}  "
end
