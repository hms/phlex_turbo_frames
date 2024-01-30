# frozen_string_literal: true

class UsersComponent < ApplicationComponent
  include Phlex::Rails::Helpers::TurboFrameTag
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::TimeFieldTag

  def initialize(users:)
    @users = users
  end

  def template
    turbo_frame_tag 'users' do
      @users.each do |user|
        div(class: 'grid grid-cols-2 bg-gray-100 mb-2 px-2') do
          p { user.email }
          p { user.name }
        end
      end

      time_field_tag :when, Time.now.strftime('%I:%M:%S'), include_seconds: true, class: 'flex'

      link_to 'Reset to :index', users_path, data: { turbo_frame: :_top },
              class: 'inline-flex mt-12 px-4 py-2 text-white bg-blue-500 rounded'
    end
  end
end
