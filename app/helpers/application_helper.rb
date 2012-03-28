module ApplicationHelper

  def nice_flash(text)
    render(:partial => 'layouts/flash', :locals => {:text => text})
  end

  def error_flash(text)
    render(:partial => 'layouts/flash_error', :locals => {:text => text})
  end
  # def locking_flash(text)
  #   render(:partial => 'layouts/flash_locking', :locals => {:text => text})
  # end

end
