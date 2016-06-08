class Search < ActiveRecord::Base
  require 'github/github'

  validate :must_have_username_or_id

  def send_req
    GitHub.new(username, gist_id, {forks: forks}).send_req
  end

  private

  def must_have_username_or_id
    if username.blank? && gist_id.blank?
      errors.add(:username, 'Must have either username or id specified')
      errors.add(:gist_id, 'Must have either username or id specified')
    end
  end
end
