module ApplicationHelper
  def normalize_html_text(html)
    raw(strip_tags(html.html_safe)[0..180] + ' ...')
  end
end
