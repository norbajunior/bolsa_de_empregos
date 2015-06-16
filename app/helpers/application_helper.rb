module ApplicationHelper
  def normalize_html_text(html, length: 170)
    raw(strip_tags(html.html_safe)[0..length] + ' ...')
  end
end
