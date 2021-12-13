# frozen_string_literal: true

module Controllers
  class UsersController
    def create(params)
      user = Models::User.new(**params.slice(:email, :password))
      Services::Stores::UserStore.save(user)
    end

    def index; end
  end
end
