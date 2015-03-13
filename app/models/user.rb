# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  avatar     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  skip_callback :save, :after, :remove_previously_stored_avatar
  # skip_callback :commit, :after, :remove_previously_stored_avatar
end
