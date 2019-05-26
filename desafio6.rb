# Se tiene un archivo llamado catalogo.txt que contiene los nombres de los productos que ofrece una
# tienda junto con los precios de las tallas L, M, S y XS.

# Polera, 10990, 7990, 4990, 2990
# Jeans, 14990, 10990, 7990, 5990
# Poleron, 12990, 8990, 5990, 3990
# Chaleco, 11990, 8990, 6990, 4990
# Parka, 19990, 14990, 11990, 9990  

# ===========  El siguiente código define la clase Product y además realiza la lectura del archivo ==============

# class Product
#     def initialize(name, large, medium, small, xsmall)
#         @name = name
#         @large = large
#         @medium = medium
#         @small = small
#         @xsmall = xsmall
#     end
# end

# products_list = []
# data = []
# File.open('catalogo.txt', 'r') { |file| data = file.readlines}
# data.each do |prod|
#     ls = prod.split(', ')
#     products_list << Product.new(ls[0], ls[1], ls[2], ls[3], ls[4])
# end

# puts products_list


# ============================== M O D I F I C A N D O ================================


class Product
    attr_accessor :name, :sizes

    def initialize(name, *sizes)
        @name = name
        @sizes = sizes.map{|e| e.to_i}
    end

    def catalogo
        return  "#{@name}, #{@sizes.join(',')}"
    end

    def catalogo_v2
        return "#{@name}, #{@sizes[0..@sizes.size-2].join(',')}"
    end
end

data = []
output = []

File.open('catalogo.txt', 'r') { |file| data = file.readlines}

data.each do |prod|
    output.push(Product.new(*prod.split(', ')).catalogo_v2)
end

File.write('output.txt', output.join("\n"))