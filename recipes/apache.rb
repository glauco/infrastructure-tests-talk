# encoding: utf-8
case node['platform']
when 'ubuntu'
  include_recipe('apt')

  package 'apache2' do
    action :install
  end

  service 'apache2' do
    action :start
  end
when 'centos'
  package 'httpd' do
    action :install
  end

  service 'httpd' do
    action :start
  end
end
