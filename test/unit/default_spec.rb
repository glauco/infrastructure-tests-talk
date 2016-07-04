require 'chefspec'
require 'chefspec/berkshelf'

describe 'example::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.converge(described_recipe)
  end

  it 'includes example::apache recipe' do
    expect(chef_run).to include_recipe('example::apache')
  end
end
