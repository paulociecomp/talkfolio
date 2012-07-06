module ApplicationHelper

  def avatar_url(user, options = {}) 
    params = ""
    options.each do |option|
      params += "&#{option[0]}=#{option[1]}"
    end

    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?#{params}"
  end
end
