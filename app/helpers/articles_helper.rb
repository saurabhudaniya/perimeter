module ArticlesHelper

  def who_like_this(count)
    html = ""
    if count.eql?(1)
      html +="<b>you like this</b>"
    elsif count.eql?(2)
      html +="<b>you and #{count-1} person like this</b>"
    elsif count > 2
      html +="<b>you and #{count-1} others like this</b>"
    end
    return html.html_safe
  end
end
