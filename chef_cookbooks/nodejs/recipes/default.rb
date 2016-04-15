bash 'install nodejs' do
  code <<-SCRIPT
    curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
    apt-get install -y nodejs
  SCRIPT
end
