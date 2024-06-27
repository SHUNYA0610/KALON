module ApplicationHelper
  def wrap_text(text, line_width = 50)
    return "" if text.blank?
    sanitized_text = h(text) # HTMLエスケープしておく

    # 改行を挿入する正規表現を調整
    wrapped_text = sanitized_text.gsub(/(.{1,#{line_width}})(?:\s+|\z)/, "\\1<br>")

    wrapped_text.html_safe
  end
end
