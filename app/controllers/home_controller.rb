class HomeController < ApplicationController
  def index
  end
 
  def program
    @test = 1
  end
  def word

    # view 없음, 액션만 존재
    @word = Spec.new
    Spec.where()
    # db 저장 후 redirect
    redirect_to '/home/storage'
  end
  def game
    
  end

  def graphic
  end

  def develop
  end

  def storage
  end

  def battery
  end

  def display
  end

  def weight
  end

  def brand
  end

  def result
  end
end
