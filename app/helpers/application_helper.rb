module ApplicationHelper

  def nbsp(num=1)
    return ('&nbsp' * num).html_safe
  end

  def justify(str, num_spaces_between)
    joint = '&nbsp;' * num_spaces_between
    return sanitize(str).split(//).join(joint).html_safe
  end
end
