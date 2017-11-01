require 'string_thing_cli'

RSpec.describe 'StringThingCLI' do
  subject(:cli) { StringThingCLI.new }

  let(:input) { object_double STDIN, read: "1\n2\n3" }
  let(:output) { object_double STDOUT, puts: nil }

  before do
    stub_const 'STDIN', input
    stub_const 'STDOUT', output
  end

  it 'reads from input' do
    expect(input).to receive(:read)
    cli.main
  end

  it 'writes to output' do
    expect(output).to receive(:puts).with 6
    cli.main
  end
end
