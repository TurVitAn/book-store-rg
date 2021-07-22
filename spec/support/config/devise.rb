require 'devise'

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:facebook] = {
  'uid' => 9.times.map { FFaker::Random.rand(1..9) }.join,
  'provider' => 'facebook',
  'credentials' => {
    'token' => FFaker::Lorem.characters(50),
    'secret' => FFaker::Lorem.characters(10)
  },
  'extra' => {
    'raw_info' => {
      'name' => FFaker::Name.first_name,
      'username' => FFaker::Name.last_name,
      'email' => FFaker::Internet.free_email
    }
  }
}

OmniAuth.config.mock_auth[:google_oauth2] = {
  'uid' => 9.times.map { FFaker::Random.rand(1..9) }.join,
  'provider' => 'google',
  'credentials' => {
    'token' => FFaker::Lorem.characters(50),
    'secret' => FFaker::Lorem.characters(10)
  },
  'extra' => {
    'raw_info' => {
      'name' => FFaker::Name.first_name,
      'username' => FFaker::Name.last_name,
      'email' => FFaker::Internet.free_email
    }
  }
}

OmniAuth.config.add_mock(:facebook, OmniAuth.config.mock_auth[:facebook])
OmniAuth.config.add_mock(:google_oauth2, OmniAuth.config.mock_auth[:google_oauth2])
