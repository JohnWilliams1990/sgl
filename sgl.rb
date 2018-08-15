# This is a simple game 0f life board which when called should print the initiql board and then
# prints n sucessive boards 
#
# ***NOTE*** this funct is called via --> ruby sgl.rb [size 0f board] [number 0f iterations]



#x = Kernel.`'#{clear}'
#p x 
#Kernel.`x`

#p ARGV



Boardsize = ARGV[0].to_i
Iterations = ARGV[1].to_i
#p ARGV


a = Array.new
0.upto(Boardsize+1) { 
	|x| 

	a[x] = Array.new(Boardsize+1, 0)
	0.upto(Boardsize+1){ |y| 
		a[x][y] =  rand(2)
	}


}

def printBoard(a)

1.upto(Boardsize) { |x| 
	
	1.upto(Boardsize) {
		|y|
	 	if a[x][y] == 1
			print 'o '

		else 
			print '- '
		end

		if y% (Boardsize) ==0 and y!=0 	
		
			puts ()

		end

	}


}
puts()
end


def nextMove(a)

	
	# total board

	#tally = Array.new(a.length, Array.new(a.length,0))
	r = a.dup

	tally = Array.new
	0.upto(Boardsize+1) { 
		|x| 

		tally[x] = Array.new(Boardsize+1, 0)
	}


	#p tally 

	1.upto(Boardsize) {|x|# print x 
		0.upto(Boardsize){|y|
			
			#stop here qnd write conditionaos for game 
			#[x-1][y+1] [x][y+1] [x+1][y+1]
			#[x-1][y]   [x][y]   [x+1][y]
			#[x-1][y-1] [x][y-1] [x+1][y-1]
		#	puts x, ' ', y 
		tally[x][y] = a[x-1][y+1] + a[x][y+1] + a[x+1][y+1] + a[x-1][y] +a[x+1][y] +a[x-1][y-1]+a[x][y-1]+a[x+1][y-1]

		}	
	}	
	1.upto(Boardsize) {|x|# print x 
		1.upto(Boardsize){|y|
#stop here for conditions 
			#
			if a[x][y] ==1
				if tally[x][y] < 2 or tally[x][y] >3
					r[x][y] = 0
				end	
			else 
				if tally[x][y] ==3
					r[x][y] =1

				end

			
				#puts x, ' ', y 

			end
		}

	}


return r 

end

0.upto(	Iterations){	

	printBoard(a) 
	a = nextMove(a)
	sleep 1 
}
#printBoard(a)


