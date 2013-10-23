After do |scenario|
  save_and_open_page if scenario.failed?
end

#AfterStep do |scenario|
#  sleep 1.seconds
#end