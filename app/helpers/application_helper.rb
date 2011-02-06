module ApplicationHelper

  def justify(str, num_spaces_between)
    return str.split(//).join('&nbsp;' * num_spaces_between)
  end
end
