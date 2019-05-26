class Table
    attr_accessor :mesa, :recaudaciones

    def initialize(mesa, *recaudaciones)
        @mesa = mesa
        @recaudaciones = recaudaciones.map{|e| e.to_i}
    end

    def mesas(mesa1, mesa2, mesa3, mesa4)
        @mesa1 = mesa1
        @mesa2 = mesa2
        @mesa3 = mesa3
        @mesa4 = mesa4
    end

   

end


total_mesas = []

file = File.open("casino.txt", "r")
data = file.readlines
file.close

data.each do |line|
    total_mesas.push(Table.new(*line.split(", ")))
end