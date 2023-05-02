module AuthenticationHelper
  def sign_in_user
    user = User.create(email: 'test@example.com', password: 'password') # Create a user for testing

    # Sign in the user using Devise
    sign_in user
  end
end
