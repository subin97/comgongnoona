class HomeController < ApplicationController
  def index
  end

  
  def upload
    a = Roo::Excelx.new(Rails.root.join('app', 'assets', 'LaptopDB.xlsx'))
    a.default_sheet = a.sheets.first
    for i in 2..140
        Spec.create!(
            brand: a.cell(i,'A'), 
            name: a.cell(i,'B'), 
            price: a.cell(i,'C'), 
            cpu: a.cell(i,'D'), 
            cpuscore: a.cell(i,'E'), 
            gpu: a.cell(i,'F'), 
            gpuscore: a.cell(i,'H'), 
            ram: a.cell(i,'I'), 
            hdd: a.cell(i,'J'), 
            ssd: a.cell(i,'K'), 
            battery: a.cell(i,'L'), 
            display: a.cell(i,'M'), 
            weight: a.cell(i,'N')
            )
    end
    redirect_to '/'
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
      $result_program = Spec.where("cpuscore <= 4000")
      
    elsif $game == 'Maplestory'
      $result_program = Spec.where("cpuscore > 4000 AND cpuscore <=6000")
    elsif  $game == 'LOL'
      $result_program = Spec.where("cpuscore > 6000 AND cpuscore <=8000")
    elsif $game == 'Overwatch'
      $result_program = Spec.where("cpuscore > 8000 AND cpuscore <= 10000")
    elsif $game == 'PUBG'
      $result_program = Spec.where("cpuscore > 10000")
    
    elsif $graphic == 'Photo'
      $result_program = Spec.where("cpuscore >= 5000")
    elsif  $graphic == 'Video'
      $result_program = Spec.where("cpuscore >= 8000")
    elsif $graphic == '3ds'
      $result_program = Spec.where("cpuscore >= 8000")
    elsif $graphic == 'CAD'
      $result_program = Spec.where("cpuscore >= 7000")
    
    elsif $develop == 'Ordinary'
      $result_program = Spec.where("cpuscore >= 5000")
    elsif  $develop == 'MachineLearning'
      $result_program = Spec.where("cpuscore >= 8000")
    end
    $result = $result_program
  end

  def battery
    $storage = params[:storage]
    
    if $storage == '128GB'
      $result_storage = $result_program.where("ssd <= 200  OR  hdd < 1000")
    elsif $storage == '256GB'
      $result_storage = $result_program.where("ssd >= 200 AND ssd < 500")
    elsif $storage == '512GB'
      $result_storage = $result_program.where("ssd >= 500 AND ssd < 1000")
    elsif $storage == '1TB'
      $result_storage = $result_program.where("ssd >= 1000  OR  hdd >=1000")
    end
    $result = $result_storage
    
    if $result.empty?
      redirect_to '/home/back'
    end
  end

  def display
    $battery = params[:battery]
    
    if $battery == 'battery_1'
      $result_battery = $result_storage.where("battery < 48")
    elsif $battery == 'battery_2'
      $result_battery = $result_storage.where("battery >= 48 AND battery < 64")
    elsif $battery == 'battery_3'
      $result_battery = $result_storage.where("battery >= 64 AND battery < 80")
    elsif $battery == 'battery_4'
      $result_battery = $result_storage.where("battery >= 80")
    end
    $result = $result_battery
    
    if $result.empty?
      redirect_to '/home/back'
    end
  end

  def weight
      $display = params[:display]
    
    if $display == '13inch'
      $result_display = $result_battery.where("display < 14.5")
    elsif $display == '15inch'
      $result_display = $result_battery.where("display >= 14.5 AND display < 16.5")
    elsif $display == '17inch'
      $result_display = $result_battery.where("display >= 16.5")
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
      $result_brand = $result_weight.where("brand = 삼성전자")
    elsif $brand == 'LG'
      $result_brand = $result_weight.where("brand = LG전자")
    elsif $brand == 'etc'
      $result_brand = $result_weight.where("brand = etc")
      # 제외 명령어
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
