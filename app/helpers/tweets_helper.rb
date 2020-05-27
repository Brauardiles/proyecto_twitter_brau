module TweetsHelper
  def render_hashtag(body)
    body.gsub(/#\w+/) {|w| link_to w, "tweets/hashtag/#{w.delete('#')}"}.html_safe
  end
end
