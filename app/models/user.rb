require 'pry'
class User < ActiveRecord::Base

  # class method
  def self.from_omniauth(auth)
    if (User.find_by(uid: auth.uid))
      user = User.find_by(uid: auth.uid)
    else
      user = User.create(
        provider:           auth.provider,
        uid:                auth.uid,
        name:               auth.info.name,
        oauth_token:        auth.credentials.token,
        oauth_expires_at:   Time.at(auth.credentials.expires_at),
        email:              auth.info.email,
        age:                auth.extra.raw_info.age_range.min.last,
        profile_photo_url:  auth.info.image
      )
    end
  end

end
# End of class.
