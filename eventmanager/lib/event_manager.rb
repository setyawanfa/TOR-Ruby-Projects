require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'time'

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

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')
  filename = "output/thanks_#{id}.html"                              
  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def clean_phonenumber(phone)
  phone_number = phone.to_s.delete('^0-9')
  if phone_number.nil?
    'bad'
  elsif phone_number.length < 10
    'bad'
  elsif phone_number.length > 11
    'bad'
  elsif phone_number.length > 10
    if phone_number[0] == 0
      phone_number[1..10]
      # phone.join("")
    else 
      'bad'
    end
  else
    phone
    #phone.join("")
  end
end

def get_hour(regdate)
  date = Time.strptime(regdate,"%m/%d/%Y %H:%M")
  date.hour.to_s
end

def get_day(regdate)
  date = Time.strptime(regdate,"%m/%d/%Y %H:%M")
  date.strftime("%A")
end

def peak_hour(reg_time)
  reg_time.sort_by{|key,value| value}[-1]
end

def day_mode(reg_day)
  reg_day.sort_by{|key,value| value}[-1]
end

contents = CSV.open(
  'event_attendees_full.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter
reg_time = Hash.new(0)
reg_day = Hash.new(0)
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone_number = clean_phonenumber(row[:homephone])
  reg_time[get_hour(row[:regdate])] += 1
  reg_day[get_day(row[:regdate])] += 1  
 # legislators = legisator_by_zipcode(zipcode)
 # form_letter = erb_template.result(binding)
 # save_thank_you_letter(id,form_letter)
  puts "#{name} #{zipcode} #{phone_number}  "
end
puts peak_hour(reg_time)
puts day_mode(reg_day)
