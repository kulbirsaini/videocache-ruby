#
# (C) Copyright Kulbir Saini <saini@saini.co.in>
# Product Website : http://cachevideos.com/
#

def create_method(name, &block); self.class.send(:define_method, name, &block); end

[ 'option' ].each do |resource|
  create_method("#{resource.pluralize}_path") { url("/#{resource.pluralize}") }
  create_method("new_#{resource}_path") { url("/#{resource.pluralize}/new") }
  create_method("edit_#{resource}_path") { |option| url("/#{resource.pluralize}/#{option.id}/edit") }
  create_method("#{resource}_path") { |option| url("/#{resource.pluralize}/#{option.id}") }
  create_method("destroy_#{resource}_path") { |option| url("/#{resource.pluralize}/#{option.id}") }
end

create_method(:login_path) { url('/login') }
create_method(:logout_path) { url('/logout') }
create_method(:root_path) { url('/') }
