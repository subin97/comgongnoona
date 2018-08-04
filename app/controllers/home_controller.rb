class HomeController < ApplicationController
  def index
  end

  def program
  end

  def game
    $program = params[:program]
    
    if params[:program] == 'Document'
      redirect_to '/home/storage'
    elsif  params[:program] == 'Graphic'
      redirect_to '/home/graphic'
    elsif params[:program] == 'Develop'
      redirect_to '/home/develop'
    end
  end

  
  def graphic
  end

  def develop
  end

  def storage
    
    $game = params[:game]
    $graphic = params[:graphic]
    $develop = params[:develop]
    

    if $program == 'Document'
      $result_program = Spec.where("cpuscore >= 100000")
      
    elsif $game == 'Maplestory'
      $result_program = Spec.where("cpuscore >= 200000")
    elsif  $game == 'LOL'
      $result_program = Spec.where("cpuscore >= 500000")
    elsif $game == 'Overwatch'
      $result_program = Spec.where("cpuscore >= 700000")
    elsif $game == 'PUBG'
      $result_program = Spec.where("cpuscore >= 900000")
    
    elsif $graphic == 'Photo'
      $result_program = Spec.where("cpuscore >= 400000")
    elsif  $graphic == 'Video'
      $result_program = Spec.where("cpuscore >= 700000")
    elsif $graphic == '3ds'
      $result_program = Spec.where("cpuscore >= 700000")
    elsif $graphic == 'CAD'
      $result_program = Spec.where("cpuscore >= 700000")
    
    elsif $develop == 'Ordinary'
      $result_program = Spec.where("cpuscore >= 300000")
    elsif  $develop == 'MachineLearning'
      $result_program = Spec.where("cpuscore >= 600000")
    end
    $result = $result_program
  end

  def battery
    $storage = params[:storage]
    
    if $storage == '128GB'
      $result_storage = $result_program.where("ssd >= 128")
    elsif $storage == '256GB'
      $result_storage = $result_program.where("ssd >= 256")
    elsif $storage == '512GB'
      $result_storage = $result_program.where("ssd >= 512")
    elsif $storage == '1TB'
      $result_storage = $result_program.where("ssd >= 10000")
    end
    $result = $result_storage
    
    if $result.empty?
      redirect_to '/home/back'
    end
  end

  def display
    $battery = params[:battery]
    
    if $battery == 'battery_1'
      $result_battery = $result_storage.where("battery >= 1")
    elsif $battery == 'battery_2'
      $result_battery = $result_storage.where("battery >= 3")
    elsif $battery == 'battery_3'
      $result_battery = $result_storage.where("battery >= 5")
    elsif $battery == 'battery_4'
      $result_battery = $result_storage.where("battery >= 7")
    end
    $result = $result_battery
    
    if $result.empty?
      redirect_to '/home/back'
    end
  end

  def weight
      $display = params[:display]
    
    if $display == '13inch'
      $result_display = $result_battery.where("monitor >= 13 AND monitor < 15")
    elsif $display == '15inch'
      $result_display = $result_battery.where("monitor >= 15 AND monitor < 17")
    elsif $display == '17inch'
      $result_display = $result_battery.where("monitor >= 17")
    end
    
    $result = $result_display
    if $result.empty?
      redirect_to '/home/back'
    end
  end

  def brand
    $weight = params[:weight]
    
    if $weight == 'weight_low'
      $result_weight = $result_display.where("weight <= 1")
    elsif $weight == 'weight_middle'
      $result_weight = $result_display.where("weight >= 1 AND weight < 2")
    elsif $weight == 'weight_high'
      $result_weight = $result_display.where("weight >= 2")
    end
    
    $result = $result_display
    if $result.empty?
      redirect_to '/home/back'
    end
  end

  def result
    $brand = params[:brand]
    
    if $brand == 'samsung'
      $result_brand = $result_weight.where("brand = samsung")
    elsif $brand == 'LG'
      $result_brand = $result_weight.where("brand = LG")
    elsif $brand == 'etc'
      $result_brand = $result_weight.where("brand = etc")
    elsif $brand == 'dontcare'
      $result_brand = $result_weight
    end
    
    $result = $result_display
    if $result.empty?
      redirect_to '/home/back'
    end
    
    
  end
  
  def back
  end
end
