### skip_callback :save, :after, :remove_previously_stored_COLUMN

An quick example app to demonstrate that, to preserve previously stored CarrierWave files, `skip_callback :commit, :after, :remove_previously_stored_MODEL` does __not__ work.

But `skip_callback :save, :after, :remove_previously_stored_COLUMN` __does__ work.

``bash
$ git clone git@github.com:somlor/carrierwave_avatar.git
$ cd carrierwave_avatar && rake db:create && rake db:migrate && rails s
$ open localhost:3000/users/new
``
