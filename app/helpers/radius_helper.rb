module RadiusHelper
  def kracken_url
    if defined? Kracken
      Kracken::PROVIDER_URL
    else
      ENV['RADIUS_OAUTH_PROVIDER_URL'].fetch { "https://account.radiusnetworks.com" }
    end
  end

  def environment_ribbon
    if ENV['ENVIRONMENT_NAME']
      content_tag(:div, ENV['ENVIRONMENT_NAME'], :id => 'environment_ribbon')
    end
  end
end
