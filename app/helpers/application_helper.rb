module ApplicationHelper
  def handle_url(url)
    if url.start_with?("http://")|| url.start_with?("https://")
      return url
    else
      url = "http://" + url
    end
  end
end
