#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#
class Option < ActiveRecord::Base
  def self.option_types
    {
      :integer => 'Integer',
      :number => 'Number',
      :range => 'Range',
      :string => 'String',
      :username => 'Username',
      :array => 'Array',
      :boolean => 'Boolean',
      :email => 'Email',
      :hostname => 'Hostname',
      :filename => 'Filename',
      :directory => 'Directory',
      :path => 'File or directory path',
      :host_with_port => 'Hostname with port'
    }
  end
end
