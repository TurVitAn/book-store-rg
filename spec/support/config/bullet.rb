RSpec.configure do |config|
  config.include ControllerMacros::InstanceMethods, bullet: true
end

module ControllerMacros
  module InstanceMethods
    %w[get post put patch delete options head].each do |method|
      define_method method do |action, **args|
        Bullet.enable = true
        Bullet.bullet_logger = true
        Bullet.raise = true
        Bullet.profile do
          super action, **args
        end
        Bullet.enable = false
      end
    end
  end
end
