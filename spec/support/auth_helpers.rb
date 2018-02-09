module AuthHelpers
  # creates header with auth_token
  def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end
end