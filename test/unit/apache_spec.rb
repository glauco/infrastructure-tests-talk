require 'chefspec'
require 'chefspec/berkshelf'

describe 'example::apache' do
  context 'when applying recipe to Ubuntu' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'includes apt recipe' do
      expect(chef_run).to include_recipe('apt')
    end

    it 'installs Apache server package' do
      expect(chef_run).to install_package('apache2')
    end

    it 'starts Apache server' do
      expect(chef_run).to start_service('apache2')
    end
  end

  context 'when applying recipe to CentOS' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.1.1503')
      runner.converge(described_recipe)
    end

    it 'installs Apache server package' do
      expect(chef_run).to install_package('httpd')
    end

    it 'starts Apache server' do
      expect(chef_run).to start_service('httpd')
    end
  end
end
