# encoding: utf-8
if os[:family] == 'ubuntu'
  package_name = 'apache2'
else
  package_name = 'httpd'
end

describe package(package_name) do
  it { should be_installed }
end

describe service(package_name) do
  it { should be_installed }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end
