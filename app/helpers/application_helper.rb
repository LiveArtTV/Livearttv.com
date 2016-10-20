module ApplicationHelper
  def store_block?
    ! %w(user_sessions users).include?(controller_name)
  end
end
