module ApplicationHelper
  def user_form_path(user)
    user.persisted? ? user_path(user) : users_path
  end

  def submit_value(record)
    record.persisted? ? 'update' : 'create'
  end
end
