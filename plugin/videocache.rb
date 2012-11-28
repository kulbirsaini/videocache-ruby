#
# (C) Copyright White Magnet Software Private Limited
# Company Website : http://whitemagnet.com/
# Product Website : http://cachevideos.com/
#

require File.expand_path('../../config/application', __FILE__)

module Videocache
  class UrlRewriter
    def initialize
      @supported_methods = [ 'GET' ]
      ::App.connect
    end

    def write_back(request_id = nil, url = '')
      STDOUT.write "#{request_id} #{url}".squish + "\n"
      STDOUT.flush
      true
    end

    def error(msg = '')
      STDERR.write "#{msg}" + "\n"
      STDERR.flush
      true
    end

    def parse_input(input)
      request_id, values = nil, input.strip.scan(/[^ ]+/)
      if values.first.integer?
        request_id = values.first.to_i
        values = values[1..-1]
      end
      return false, request_id if values.size < 4

      url, client_ip_fqdn, user, method = values
      client_ip, fqdn = client_ip_fqdn.split('/')
      error([request_id, url.first(60), client_ip, fqdn, user, method.upcase]) #FIXME remove this
      return false, request_id if url.blank?
      return true, request_id, url, client_ip, fqdn, user, method.upcase
    end

    def run!
      ARGF.each_line do |input|
        valid, request_id, url, client_ip, fqdn, user, method = parse_input(input)
        write_back(request_id) and error('invalid') and next unless valid and @supported_methods.include?(method)

        if input =~ /.co.in/
          write_back request_id, "302:http://ibnlive.in.com/"
        else
          write_back request_id
        end
      end
    end
  end
end

Videocache::UrlRewriter.new.run! if __FILE__ == $0
