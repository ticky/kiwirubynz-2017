require 'my_awesome_app'

RSpec::Matchers.define :have_id do |id|
  # oh boy / adapted from <https://stackoverflow.com/a/16681085>
  def deep_find(key, value, object = self, found = nil)
    if object.respond_to?(:key?) && object.key?(key) && object[key] == value
      object[key]
    elsif object.is_a? Enumerable
      object.find { |*a| found = deep_find(key, value, a.last) }
      found
    end
  end

  match do |data|
    deep_find(:id, id, data).nil? == false
  end
end

RSpec.describe 'MyAwesomeApp' do
  it 'returns data with an ID' do
    expect(MyAwesomeApp.get(:index)).to have_id(1)
  end

  it 'returns data with an ID' do
    expect(MyAwesomeApp.get(:show, id: 1)).to have_id(1)
  end
end
