bash 'mongodb-org-3' do
  code <<-SCRIPT
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
    apt-get update
  SCRIPT
  not_if { ::File.exists?('/etc/apt/sources.list.d/mongodb-org-3.2.list') }
end

package 'mongodb-org'
