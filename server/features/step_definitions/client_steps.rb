Given /^I have a cucumber result with:$/ do |table|
  @attributes = table.hashes.first
end

Given /^there isn't a record for that cucumber result$/ do
  Result.find_by_name(@attributes['name']).should be_nil
end

When /^I submit it$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  post '/results', @attributes.to_json
end

Then /^it should be available in the database$/ do
  Result.find_by_name(@attributes['name']).should_not be_nil
end

Given /^there is a record for that cucumber result$/ do
  Result.create(@attributes.merge({:value => 'pass'})).should_not be_nil
end

Then /^the record should be overwritten$/ do
  Result.find_all_by_name(@attributes['name']).size.should eq(1)
  Result.find_by_name(@attributes['name']).value.should eq('fail')
end