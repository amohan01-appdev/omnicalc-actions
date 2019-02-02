class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max-@numbers.min

    sorted=@numbers.sort
    eo_test=@numbers.count%2
    even_lower=(@numbers.count/2)-1
    even_upper=@numbers.count/2
    odd_place=(@numbers.count/2)
    
    even=(sorted[even_lower]+sorted[even_upper])/2
    odd=(sorted[odd_place])
    
   if 
     eo_test==0
     median=even
    else
    median=odd
   end

    @median = median

    @sum = @numbers.sum

    @mean = @numbers.sum/@numbers.count

    step_1 = []            
    @numbers.each do |num|      
    step_2 = (num - @mean)**2            
    step_1.push(step_2)
    end

    @variance = step_1.sum/@numbers.count

    @standard_deviation = @variance**0.5

  mode = @numbers.at(0)
  @numbers.each do |number|
   
   if @numbers.count(number) > @numbers.count(mode)
   mode = number 
   end 
  end

    @mode = mode
    
    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
