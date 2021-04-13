require 'devise'

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:facebook] = {
  'uid' => '1111',
  'provider' => 'facebook',
  'credentials' => {
    'token' => 'token',
    'secret' => 'secret'
  },
  'extra' => {
    'raw_info' => {
      'name' => 'Blonde Brain',
      'username' => 'blonde_brain',
      'email' => 'blonde@brain.com'
    }
  }
}

OmniAuth.config.add_mock(:facebook, OmniAuth.config.mock_auth[:facebook])
