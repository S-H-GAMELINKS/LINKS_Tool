# encoding: Windows-31J

#各種エンジン用タグ登録メソッド
def script_tag(flag, str)

	#ファイル名用変数
	input_filename = nil
	output_filename = nil

	#ファイルの指定ループ(Nscripter2)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#変換したいファイル名の指定(Nscripter2)
		print "タグを登録したいファイルを指定してください："
		input_filename = gets.strip

		#変換後のファイル名指定(Nscripter2)
		print "タグ登録後のファイル名を入力してください:"
		output_filename = gets.strip
	end

	#指定したファイルの読込
	text = open("#{input_filename}.txt", "r+")
	str = text.read

	#各種エンジン用タグ登録へ分岐
	case flag

	#LINKS用タグ登録
	when 1

		#タグの登録(LINKS)
		str.gsub!(/。/, "。P")
		str.gsub!(/」/, "」P")
		str.gsub!(/^$/, "R")
		str.gsub!(/^/, "L")
		str.gsub!(/LR/, "R")

		#指定したファイル名で出力(LINKS)
		File.open("#{output_filename}.txt", "w") do |file|
			file.write str
		end

	#ティラノスクリプト用タグ登録
	when 2

		#タグの登録(ティラノスクリプト)
		str.gsub!(/$/, "[p]")
		str.gsub!(/。/, "。[l]")
		str.gsub!(/^\[p\]$/, "")
		str.gsub!(/\[l\]\[p\]$/, "[p]")

		#指定したファイル名で出力(ティラノスクリプト)
		File.open("#{output_filename}.ks", "w") do |file|
			file.write str.encode("UTF-8")
		end

	#吉里吉里2用タグ登録
	when 3

		#タグの登録(吉里吉里Z)
		str.gsub!(/$/, "[p]")
		str.gsub!(/。/, "。[l]")
		str.gsub!(/^\[p\]$/, "[cm]")
		str.gsub!(/\[l\]\[p\]$/, "[p]")

		#指定したファイル名で出力(吉里吉里2)
		File.open("#{output_filename}.ks", "w") do |file|
			file.write str.encode("UTF-8")
		end

	#Nscripter2用タグ登録
	when 4

		#タグの登録(Nscripter2)
		str.gsub!(/。/, "。\\p")
		str.gsub!(/」/, "」\\p")
		str.gsub!(/$/, "\\p")
		str.gsub!(/^\\p/, "")
		str.gsub!(/\\p\\p/, "\\p")

		#指定したファイル名で出力(Nscripter2)
		File.open("#{output_filename}.txt", "w") do |file|
			file.write str.encode("UTF-8")
		end
	end
end