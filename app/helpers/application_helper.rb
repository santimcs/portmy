module ApplicationHelper

	def num_of_spread(minp,maxp)
    div = 0.0
    gap = 0.0
    spd = 0
    if (maxp > minp) 
    	gap = maxp - minp
    	mult = 1
    else
    	tmpp = minp
    	minp = maxp
    	maxp = tmpp
    	gap  = maxp - minp
    	mult = -1
    end
    if gap != 0
        case maxp
    	    when 0.00..2.00 then 
            begin
                div = 0.01 
                spd = gap/div
            end
    	    when 2.02..5.00 then 
            begin
    		    div = 0.02
                boundary = div * 100
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.01
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end
    	    end      
    	    when 5.05..10.00 then  
            begin
    		    div = 0.05
                boundary = div * 100
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.02
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end            
    	    end      
    	    when 10.10..25.00 then 
    	    begin
    		    div = 0.10
                boundary = div * 100
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.05
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end          
    	    end   
    	    when 25.25..100.00 then 
    	    begin
    		    div = 0.25
                boundary = div * 100
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.10
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end            
    	    end    
    	    when 100.50..200.00 then 
    	    begin
    		    div = 0.50
                boundary = div * 200
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.25
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end             
    	    end      
    	    when 201.00..400.00 then 
    	    begin
    		    div = 1.00
                boundary = div * 200                
    		    if minp < boundary
    			    spd = (boundary - minp) / 0.50
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end            
    	    end   
    	    else 
    	    begin
    		    div = 2.00
                boundary = div * 200
    		    if minp < boundary
    			    spd = (boundary - minp) / 1.00
    			    spd += (maxp - boundary) / div
    		    else
    			    spd = gap/div
                end            
    	    end         
        end	
	end
	return spd * mult
	end

end
