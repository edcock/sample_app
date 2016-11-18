module UsersHelper
  def gravatar_for(user, options={size: 80})
    email = user.email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email)
    # compile URL which can be used in <img src="RIGHT_HERE"...
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
