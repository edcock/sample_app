module UsersHelper
  def gravatar_for(user)
    email = user.email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email)
    # compile URL which can be used in <img src="RIGHT_HERE"...
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
