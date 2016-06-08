class Search < ActiveRecord::Base
  require 'github/github'

  def send_req
    return [] if gist_id.blank? && username.blank?
    if gist_id
      GitHub.get_by_id(gist_id)
    elsif username
      GitHub.get_by_username(username)
    end
  end
end
