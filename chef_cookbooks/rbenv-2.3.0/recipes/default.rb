%w(libssl-dev libreadline-dev zlib1g-dev).each do |pkg|
  package pkg
end

git 'rbenv' do
  repository 'https://github.com/rbenv/rbenv.git'
  user 'vagrant'
  destination '/home/vagrant/.rbenv'
end

bash 'create ~/.rbenv/plugins' do
  user 'vagrant'
  code 'mkdir -p /home/vagrant/.rbenv/plugins'
end

git 'ruby-build' do
  user 'vagrant'
  repository 'https://github.com/rbenv/ruby-build.git'
  destination '/home/vagrant/.rbenv/plugins/ruby-build'
end

bash 'setup rbenv' do
  user 'vagrant'
  environment 'HOME' => '/home/vagrant'
  code <<-SCRIPT
    cd ~/.rbenv && src/configure && make -C src
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

    /home/vagrant/.rbenv/bin/rbenv install 2.3.0
    /home/vagrant/.rbenv/bin/rbenv global 2.3.0
  SCRIPT
  not_if { File.foreach('/home/vagrant/.bashrc').grep(/rbenv/).any? }
end

gem_package 'bundler'
