module ApplicationHelper
  def show_messages(flash)
    if flash[:notice]
      return "<div class=alert alert-success> #{flash[:notice]} </div>".html_safe
    elsif flash[:error]
      return "<div class=alert alert-danger> #{flash[:error]} </div>".html_safe
    end
    nil
  end

  def home_path
    '/home'
  end
  
end
