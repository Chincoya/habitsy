# frozen_string_literal: true

module ApplicationHelper
  def title_helper(title)
    return title if title

    'HABITSY'
  end

  def action_button_helper(button)
    return '<div class="action-button"></div>'.html_safe if button.blank?

    button
  end

  def date_helper(created_at)
    created_at.strftime('%d %b %y')
  end

  def to_time_format(amount)
    time = Time.at(amount * 60).utc.strftime('%HH:%MM')

    "<span class=\"time\">#{time}</span>".html_safe
  end
end
