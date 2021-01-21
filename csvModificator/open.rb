#<Encoding:UTF-8>
class Formulario
	RGX_nombre=/^(\** *Nombre: )(?<nombre>(.*)$)/.freeze
	RGX_apellido=/^(\** *Apellido: )(?<apellido>(.*)$)/.freeze
	RGX_email=/^(^\** *Email:)(?<email>(.*)$)/.freeze
	RGX_telefono=/^(^\** *Telefono:)(?<telefono>(.*)$)/.freeze
	RGX_direccion=/^(^\** * Direccion:)(?<direccion>(.*)$)/.freeze
    RGX_departamento=/^(^\** *Departamento:)(?<departamento>(.*)$)/.freeze
	RGX_ciudad=/^(^\** *Ciudad:)(?<ciudad>(.*)$)/.freeze
	RGX_juntar_lineas=/^(?<linea>(.*))(=)$/.freeze
	def leer_archivo
		File.open('/home/jsepulveda/.thunderbird/lbdvzhp0.default/Mail/192.168.0-5.254/Inbox.sbd/Nuevo_Registro', 'r:UTF-8') do |f1|
			oldlinea = ''
			while linea = f1.gets
				linea=linea.chomp
				match=RGX_juntar_lineas.match(linea)
				if  match.nil?
					linea= oldlinea + linea  if oldlinea > ''
					oldlinea = ''
					else
          oldlinea = match.named_captures['linea']
          next
        end
				match=RGX_nombre.match(linea)
				unless match.nil?
					print normaliza(match.named_captures['nombre'])
					print "\t"
					next
				end
				match=RGX_apellido.match(linea)
				unless match.nil?
					print normaliza(match.named_captures['apellido'])
					print "\t"
					next
				end
				match=RGX_email.match(linea)
				unless match.nil?
					print normaliza(match.named_captures['email'])
					print "\t"
					next
				end
				match=RGX_telefono.match(linea)
        unless match.nil?
          print normaliza(match.named_captures['telefono'])
          print "\t"
          next
        end
				match=RGX_direccion.match(linea)
        unless match.nil?
          print normaliza(match.named_captures['direccion'])
          print "\t"
          next
        end
				match=RGX_departamento.match(linea)
        unless match.nil?
          print normaliza(match.named_captures['departamento'])
          print "\t"
          next
        end
				match=RGX_ciudad.match(linea)
        unless match.nil?
          print normaliza(match.named_captures['ciudad'])
          print "\n"
          next
        end
			end
		end
	end

	def normaliza(linea)
		lin = linea.gsub(/\=C3\=B3/,'ó')
		lin = lin.gsub(/\=C3\=A1/,'á')
		lin = lin.gsub(/\=C3\=A9/,'é')
		lin = lin.gsub(/\=C3\=AD/,'í')
		lin = lin.gsub(/\=C3\=BA/,'ú')
		lin = lin.gsub(/\=C3\=B1/,'ñ')
		lin = lin.gsub(/\=C3\=81/,'Á')
		lin = lin.gsub(/\=C3\=93/,'Ó')
	  lin = lin.gsub(/\=C3\=9A/,'Ú')
		lin = lin.gsub(/\=C3\=91/,'Ñ')
		lin = lin.gsub(/\=20/,'')
	end
end

form=Formulario.new
form.leer_archivo

