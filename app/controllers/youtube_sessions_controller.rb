require 'google/api_client/client_secrets'

class YoutubeSessionsController < ApplicationController
skip_after_action :verify_authorized
skip_before_action :authenticate_user!, only: %i[new callback auth_client redirect_uri]
  def new
    @youtube_session = YoutubeSession.new
    authorize(@youtube_session)
    redirect_to auth_client.authorization_uri.to_s
  end

  def callback
    auth_client.code = params[:code]
    auth_client.fetch_access_token!
    auth_client.client_secret = nil
    # session[:credentials] = auth_client.to_json
    YoutubeSession.create!(
      credentials: auth_client
    )
    redirect_to '/'
  end

  def auth_client
    @auth_client ||= begin
      client_secrets = Google::APIClient::ClientSecrets.new(
        {
          "web": {
            "client_id": Rails.application.credentials.dig(:youtube, :client_id),
            "project_id": "clock-management-309110",
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
            "client_secret": Rails.application.credentials.dig(:youtube, :client_secret),
            "redirect_uris": [
              redirect_uri
            ]
          }
        }
      )
      auth_client = client_secrets.to_authorization
      auth_client.update!(
        scope: 'https://www.googleapis.com/auth/youtube.force-ssl',
        redirect_uri: redirect_uri,
        additional_parameters: {
          access_type: 'offline',
          include_granted_scopes: true
        }
      )
      auth_client
    end
  end

  def redirect_uri
    'http://localhost:3000/youtube_sessions/callback'
  end
end
