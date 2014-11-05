module.exports = ->
  # install latest stable binaries from official ppa
  @then @execute, 'add-apt-repository ppa:nginx/stable'
  @then @execute, 'add-get update'
  @then @install, 'nginx'
