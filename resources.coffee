_ = require 'lodash'
module.exports = ->
  _.assign @,
    nginx_site: (name, [o]..., cb) =>
      switch o?.action
        when 'enable'
          @template o.template,
            to: "/etc/nginx/sites-available/#{name}.conf"
            sudo: true
            owner: 'root'
            group: 'root'
            mode: '0755'
            =>
              @link "/etc/nginx/sites-available/#{name}.conf",
                to: "/etc/nginx/sites-enabled/#{name}.conf"
                sudo: true
                cb()
        when 'disable'
          @execute "rm /etc/nginx/sites-available/#{name}.conf", sudo: true, cb
        else
          @die "invalid action passed to @nginx_site(): #{name}"
