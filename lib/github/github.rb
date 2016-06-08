require 'httparty'

module GitHub
  extend self

  def get_by_id(id)
    uri = base_uri + gists_uri + '/' + id.to_s
    HTTParty.get(uri)
  end

  def get_by_username(username)
    uri = base_uri + users_uri + '/' + username + gists_uri
    HTTParty.get(uri)
  end

  private

  def base_uri
    @__base_uri__ ||= 'https://api.github.com'
  end

  def gists_uri
    @__gists_uri__ ||= '/gists'
  end

  def users_uri
    @__users_uri__ ||= '/users'
  end
end
