#
# Cookbook Name:: logrotate
# Recipe:: default
#
# Copyright 2015, Simone Dall Angelo
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe "logrotate::global"

# Logrotate application's log
logrotate_app node["logrotate"]["application"]["name"] do
  cookbook 'logrotate'
  path "#{node["logrotate"]["application"]["deploy_dir"]}#{node["logrotate"]["application"]["name"]}/current/log/*.log"
  frequency 'daily'
  rotate 7
  size "100M"
  options ['missingok', 'compress', 'delaycompress', 'dateext']
end

# Logrotate nginx's log
logrotate_app "nginx" do
  cookbook 'logrotate'
  path "/opt/nginx/logs/*.log"
  frequency 'daily'
  rotate 7
  size "100M"
  maxage 7
  options ['missingok', 'compress', 'delaycompress', 'dateext']
end

# Logrotate mariadb's log
logrotate_app "mysql" do
  cookbook 'logrotate'
  path node["logrotate"]["mariadb"]["error_log"]
  frequency 'daily'
  rotate 7
  size "100M"
  maxage 7
  options ['missingok', 'compress', 'delaycompress', 'dateext']
end
