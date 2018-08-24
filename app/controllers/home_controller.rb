class HomeController < ApplicationController
  def index
  end
  
  def upload
    # 엑셀DB업로드
    a = Roo::Excelx.new(Rails.root.join('app', 'assets', 'LaptopDB0816_2.xlsx'))
    a.default_sheet = a.sheets.first
    for i in 2..140
        Spec.create!(
            brand: a.cell(i,'A'), 
            name: a.cell(i,'C'), 
            price: a.cell(i,'D'), 
            cpu: a.cell(i,'E'), 
            cpuscore: a.cell(i,'F'), 
            gpu: a.cell(i,'G'), 
            gpuscore: a.cell(i,'I'), 
            ram: a.cell(i,'J'), 
            hdd: a.cell(i,'K'), 
            ssd: a.cell(i,'L'), 
            battery: a.cell(i,'M'), 
            display: a.cell(i,'N'), 
            weight: a.cell(i,'O'),
            imagelink: a.cell(i,'Q')
          )
            
    end
    redirect_to '/'
  end


  def program
  end
  def action1
    @program = params[:program]
    if @program == 'Document'
       redirect_to '/home/portability'
    elsif @program == 'Game'
      redirect_to '/home/game'
    elsif @program == 'Graphic'
      redirect_to '/home/graphic'
    elsif @program == 'Develop'
      redirect_to '/home/develop'
    else
      redirect_to '/home/portability'
    end
  end
  
  def game
    @program = 'Game'
  end

  def graphic
    @program = 'Graphic'
  end

  def develop
    @program = 'Develop'
  end
  
  def portability
    @game = params[:game]
    @graphic = params[:graphic]
    @develop = params[:develop]
    
    # 문서작업 필터링
    @result_program = "cpuscore<=5000"
    # if @program == 'Document'
      # @result_program = "cpuscore <= 5000"
      
    # 게임 필터링
    if @game == 'Maplestory'
      @result_program = "gpuscore >= 700 AND ram >=4"
    elsif  @game == 'LOL'
      @result_program = "gpuscore >= 1000 AND ram >=4"
    elsif @game == 'Overwatch'
      @result_program = "cpuscore >= 4000 AND gpuscore >= 4000 AND ram >=6"
    elsif @game == 'PUBG'
      @result_program = "cpuscore >= 7500 AND gpuscore >= 8000 AND ram >=16"
      
    # 그래픽작업 필터링
    elsif @graphic == 'Photo'
      @result_program = "cpuscore >= 4000 AND ram >=8"
    elsif  @graphic == 'Video'
      @result_program = "cpuscore >= 7000 AND gpuscore >= 2000 AND ram >=16"
    elsif @graphic == '3ds'
      @result_program = "cpuscore >= 5000 AND ram >= 8"
    elsif @graphic == 'CAD'
      @result_program = "cpuscore >= 4000 AND ram >= 8"
      
    # 개발 필터링
    elsif @develop == 'Ordinary'
      @result_program = "cpuscore >= 4000 AND ram >=4"
    elsif  @develop == 'MachineLearning'
      @result_program = "cpuscore >= 7000 AND gpuscore >= 6000 AND ram >=16"
      # 지포스 그래픽카드만 필터링으로 
    end
  end
  
  def storage
    @result_program = params[:result_program]
    @portability = params[:portability]
    #휴대성 필터링
    if @portability == 'portable'
      @result_portability = "display<=15 AND weight <=1.5"
    elsif @portability == 'HQportable'
      @result_portability = "display<=15 AND weight<2.3"
    elsif @portability == 'HQonly'
      @result_portability = "display>=15 AND weight>=2.3"
    end
    @result = Spec.where(@result_program).where(@result_portability)

    if @result.empty?
      redirect_to '/home/back'
    end
  end

  # def battery
  #   @result_program = params[:result_program]
  #   @storage = params[:storage]
    
  #   if @storage == '128GB'
  #     @result_storage = "ssd <= 200  OR  hdd < 1000"
  #   elsif @storage == '256GB'
  #     @result_storage = "ssd >= 200 AND ssd < 500"
  #   elsif @storage == '512GB'
  #     @result_storage = "ssd >= 500 AND ssd < 1000"
  #   elsif @storage == '1TB'
  #     @result_storage = "ssd >= 1000  OR  hdd >=1000"
  #   end
  #   @result = Spec.where(@result_storage).where(@result_program)
    
  #   if @result.empty?
  # def display
  #   $battery = params[:battery]
    
  #   if $battery == 'battery_1'
  #     $result_battery = $result_storage.where("battery < 48")
  #   elsif $battery == 'battery_2'
  #     $result_battery = $result_storage.where("battery >= 48 AND battery < 64")
  #   elsif $battery == 'battery_3'
  #     $result_battery = $result_storage.where("battery >= 64 AND battery < 80")
  #   elsif $battery == 'battery_4'
  #     $result_battery = $result_storage.where("battery >= 80")
  #   end
  #   $result = $result_battery
    
  #   if $result.empty?
  #     redirect_to '/home/back'
  #   end
  # end

  # def display
  #   @result_storage = params[:result_storage]
  #   @result_program = params[:result_program]
  #   @battery = params[:battery]
    
  #   if @battery == 'battery_1'
  #     @result_battery = "battery < 48"
  #   elsif @battery == 'battery_2'
  #     @result_battery = "battery >= 48 AND battery < 64"
  #   elsif @battery == 'battery_3'
  #     @result_battery = "battery >= 64 AND battery < 80"
  #   elsif @battery == 'battery_4'
  #     @result_battery = "battery >= 80"
  #   end
  
  #   @result = Spec.where(@result_storage).where(@result_program).where(@result_battery)
    
  #   if @result.empty?
  #     redirect_to '/home/back'
  #   end
  # end

  # def weight
  #   @result_storage = params[:result_storage]
  #   @result_program = params[:result_program] 
  #   @result_battery = params[:result_battery]
  #   @display = params[:display]
    
  #   if @display == '13inch'
  #     @result_display = "display < 14.5"
  #   elsif @display == '15inch'
  #     @result_display = "display >= 14.5 AND display < 16.5"
  #   elsif @display == '17inch'
  #     @result_display = "display >= 16.5"
  #   end
    
  #   # where
  #   @result = Spec.where(@result_storage).where(@result_program).where(@result_battery).where(@result_display)
    
  #   if @result.empty?
  #     redirect_to '/home/back'
  #   end
  # end
  # def weight
  #     $display = params[:display]
    
  #   if $display == '13inch'
  #     $result_display = $result_battery.where("display < 14.5")
  #   elsif $display == '15inch'
  #     $result_display = $result_battery.where("display >= 14.5 AND display < 16.5")
  #   elsif $display == '17inch'
  #     $result_display = $result_battery.where("display >= 16.5")
  #   end
    
  #   $result = $result_display
  #   if $result.empty?
  #     redirect_to '/home/back'
  #   end
  # end

  def brand
    @result_program = params[:result_program] 
    @result_portability = params[:result_portability]
    @storage = params[:storage]
    # 용량 필터링
    if @storage == 'ssd_low'
      @result_storage = "ssd < 500 AND hdd <1"
    elsif @storage == 'ssd_high'
      @result_storage = "ssd >= 500 AND hdd <1"
    elsif @storage == 'ssd_hdd'
      @result_storage = "ssd >0 AND hdd >0"
    end
    @result = Spec.where(@result_program).where(@result_portability).where(@result_storage)

    if @result.empty?
      redirect_to '/home/back'
    end
  end

  def result
    @brand = params[:brand]
    @result_storage = params[:result_storage]
    @result_program = params[:result_program] 
    @result_portability = params[:result_portability]
    # 브랜드 필터링
    if @brand == 'samsung'
      @result_brand = Spec.where(@result_portability).where(@result_storage).where(@result_program).where(["brand = '%s'", "삼성전자"])
    elsif @brand == 'LG'
      @result_brand = Spec.where(@result_portability).where(@result_storage).where(@result_program).where(["brand = '%s'", "LG전자"])
    elsif @brand == 'etc'
      @result_brand = Spec.where(@result_portability).where(@result_storage).where(@result_program).where.not(brand: "삼성전자").where.not(brand: "LG전자")
      # not in samsung, LG
    elsif @brand == 'dontcare'
      @result_brand = Spec.where(@result_portability).where(@result_storage).where(@result_program)
    end
    
    @result = @result_brand 
    if @result.empty?
      redirect_to '/home/back'
    end
    
    # 평균
    @count = 0
    @result.each do |r|
      @count += 1
    end
    
    # # 금은동
    # @result.each do |r|
    #   if r.cpuscore<avgcpu-10000
    #     @cpumedal = 1   # 동
    #   elsif r.cpuscore>avgcpu-10000 and r.cpuscore<avgcpu+10000
    #     @cpumedal = 2   # 은
    #   else
    #     @cpumedal = 3   # 금
    #   end
    # end
    
    # 정렬 가격순
    @top4 = @result.order(:price).first(4)
    @others = @result.order(:price).offset(4)
  end
  
  
  def back
  end
end
