module.exports = ->
  # install latest stable binaries from official ppa
  @then @install, 'python-software-properties' # optional; only needed by ubuntu <12
  @then @execute, 'add-apt-repository ppa:nginx/stable', sudo: true
  @then @execute, 'apt-get update', sudo: true
  @then @install, 'nginx'
