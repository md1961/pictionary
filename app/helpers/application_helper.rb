module ApplicationHelper

  def nbsp(num=1)
    return ('&nbsp' * num).html_safe
  end

  def justify(str, num_spaces_between)
    return str.split(//).join('&nbsp;' * num_spaces_between)
  end
end
