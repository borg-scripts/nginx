_ = require 'lodash'
module.exports = ->
  _.assign @,
    nginx_site: (name, [o]...) => @inject_flow =>
      switch o?.action
        when 'enable'
          @then @template o.template,
            to: "/etc/nginx/sites-available/#{name}.conf"
            sudo: true
            owner: 'root'
            group: 'root'
            mode: '0755'
          @then @link "/etc/nginx/sites-available/#{name}.conf",
            target: "/etc/nginx/sites-enabled/#{name}.conf"
            sudo: true
        when 'disable'
          @then @execute "rm /etc/nginx/sites-available/#{name}.conf", sudo: true
        else
          @die("invalid action passed to @nginx_site(): #{name}")() # immediate death
