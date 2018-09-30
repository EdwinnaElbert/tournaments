# frozen_string_literal: true

class WelcomeController < AppController
  def index
    @tournaments = Tournament.where(active: true)
  end
end
