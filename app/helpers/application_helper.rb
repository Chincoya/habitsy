# frozen_string_literal: true

module ApplicationHelper
  def title_helper(title)
    return title if title

    'HABITSY'
  end
end
