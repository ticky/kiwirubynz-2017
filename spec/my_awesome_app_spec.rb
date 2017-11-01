require 'my_awesome_app'

RSpec.describe 'MyAwesomeApp' do
  it 'returns data with an ID' do
    expect(MyAwesomeApp.get(:index)).to a_hash_including(
      some_models: array_including(hash_including(id: 1))
    )
  end
end
