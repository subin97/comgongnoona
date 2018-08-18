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
    
    @result_program = "cpuscore>60"
    if @program == 'Document'
      @result_program = "cpuscore <= 4000"
    
    elsif @game == 'Maplestory'
      @result_program = "cpuscore > 4000 AND cpuscore <=6000"
    elsif  @game == 'LOL'
      @result_program = "cpuscore > 6000 AND cpuscore <=8000"
    elsif @game == 'Overwatch'
      @result_program = "cpuscore > 8000 AND cpuscore <= 10000"
    elsif @game == 'PUBG'
      @result_program = "cpuscore > 10000"
    
    elsif @graphic == 'Photo'
      @result_program = "cpuscore >= 5000"
    elsif  @graphic == 'Video'
      @result_program = "cpuscore >= 8000"
    elsif @graphic == '3ds'
      @result_program = "cpuscore >= 8000"
    elsif @graphic == 'CAD'
      @result_program = "cpuscore >= 7000"
    
    elsif @develop == 'Ordinary'
      @result_program = "cpuscore >= 5000"
    elsif  @develop == 'MachineLearning'
      @result_program = "cpuscore >= 8000"
    end
  end
  
  def storage
    # 휴대성  
    @result_program = params[:result_program]
    @portability = params[:portability]
    
    # @result_portability 연산
  end

  
  def brand
    @result_program = params[:result_program] 
    @result_portability = params[:result_portability]
    @storage = params[:storage]
    
    if @storage == '128GB'
      @result_storage = "ssd <= 200  OR  hdd < 1000"
    elsif @storage == '256GB'
      @result_storage = "ssd >= 200 AND ssd < 500"
    elsif @storage == '512GB'
      @result_storage = "ssd >= 500 AND ssd < 1000"
    elsif @storage == '1TB'
      @result_storage = "ssd >= 1000  OR  hdd >=1000"
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
    
  end
  
  def back
  end
end
