class UsersController < ApplicationController

  def index
    @users = User.all

    if turbo_frame_request?
      # works -- this is the expected code path
      render partial: 'user', locals: { users: @users }

      # Almost works -- but it renders the <html>, <head>, and <body> tags
      # What impact does this have?
      # It seems as if the turbo code is treating the empty tags as a no-op, but ....?????
      # render UsersComponent.new(users: @users), layout: 'turbo_rails/frame'

      # works -- makes me feel dirty
      # render partial: 'turbo_frame',
      #   locals: { target: 'users', component: UsersComponent.new(users: @users) }

      # fails -- as expect, missing the turbo-frame tag
      # render partial: 'user', locals: { users: @users }

      # fails -- Phlex and partials don't mix
      # render partial: UsersComponent.new(users: @users)

      # fails -- full page refresh
      # render UsersComponent.new(users: @users), layout: nil

      # fails -- tag is updated, but lost turbo-frame behaviours such as src attribute and advance behavior
      # render turbo_stream: turbo_stream.replace('users', partial: 'user', locals: { users: @users })

      # fails -- tag is updated, but lost turbo-frame behaviours such as src attribute and advance behavior
      # render turbo_stream: turbo_stream.replace('users', UsersComponent.new(users: @users))

      # fails -- Phlex and partials don't mix
      # render turbo_stream: turbo_stream.replace('users', partial: UsersComponent.new(users: @users))
    end
  end
end
