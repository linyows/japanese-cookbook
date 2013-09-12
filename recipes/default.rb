# Cookbook Name:: japanese
# Recipe:: default

case node[:platform]
when 'redhat', 'centos'
  bash 'setup_japanese_enviroment' do
    code <<-EOC
      yum -y groupinstall "Japanese Support"
    EOC
    not_if 'test $LANG = ja_JP.UTF-8'
  end

when 'ubuntu'
  bash 'setup_japanese_enviroment' do
    codename = case node[:platform_version]
    when '13.04' then 'raring'
    when '12.10' then 'quantal'
    when '12.04' then 'precise'
    end

    code <<-EOC
      wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | apt-key add -
      wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | apt-key add -
      wget https://www.ubuntulinux.jp/sources.list.d/#{codename}.list -O /etc/apt/sources.list.d/ubuntu-ja.list
      add-apt-repository ppa:ikoinoba/ppa
      apt-get update
      apt-get upgrade
      apt-get install language-pack-ja
      locale-gen ja_JP.UTF-8
      dpkg-reconfigure locales
      update-locale LANG=ja_JP.UTF-8
      echo "LC_ALL=ja_JP.UTF-8" >> /etc/default/locale
    EOC
    not_if 'test $LANG = ja_JP.UTF-8'
  end
end
