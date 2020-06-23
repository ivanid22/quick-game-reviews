module ApplicationHelper
  def show_messages(flash)
    return "<div class=alert alert-success> #{flash[:notice]} </div>".html_safe if flash[:notice]

    return "<div class=alert alert-danger> #{flash[:error]} </div>".html_safe if flash[:error]

    nil
  end

  def home_path
    '/home'
  end
end
