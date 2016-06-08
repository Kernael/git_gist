require 'httparty'

class GitHub

  def initialize(username, gist_id, opts = {})
    @uri  = base_uri
    @opts = opts

    if not gist_id.blank?
      get_by_id(gist_id, opts)
    elsif not username.blank?
      get_by_username(username)
    else
      get_by_list
    end
  end

  def send_req
    r = HTTParty.get(@uri)
    r += HTTParty.get(@uri + forks_uri) if @opts[:forks]
    r
  end

  private

  def get_by_list
    @uri += gists_uri
  end

  def get_by_id(gist_id, opts)
    get_by_list
    @uri += '/' + gist_id.to_s
  end

  def get_by_username(username)
    @uri += users_uri + '/' + username + gists_uri
  end

  def base_uri
    @__base_uri__ ||= 'https://api.github.com'
  end

  def gists_uri
    @__gists_uri__ ||= '/gists'
  end

  def users_uri
    @__users_uri__ ||= '/users'
  end

  def forks_uri
    @__forks_uri__ ||= '/forks'
  end
end
