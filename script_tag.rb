# encoding: Windows-31J

#LINKS用タグ登録
def LinksTag(output_filename, str)
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
end

#ティラノスクリプト用タグ登録
def TyranoTag(output_filename, str)
		#タグの登録(ティラノスクリプト)
		str.gsub!(/$/, "[p]")
		str.gsub!(/。/, "。[l]")
		str.gsub!(/^\[p\]$/, "")
		str.gsub!(/\[l\]\[p\]$/, "[p]")

		#指定したファイル名で出力(ティラノスクリプト)
		File.open("#{output_filename}.ks", "w") do |file|
			file.write str.encode("UTF-8")
		end
end

#吉里吉里用タグ登録
def KirikiriTag(output_filename, str)
		#タグの登録(吉里吉里Z)
		str.gsub!(/$/, "[p]")
		str.gsub!(/。/, "。[l]")
		str.gsub!(/^\[p\]$/, "[cm]")
		str.gsub!(/\[l\]\[p\]$/, "[p]")

		#指定したファイル名で出力(吉里吉里2)
		File.open("#{output_filename}.ks", "w") do |file|
			file.write str.encode("UTF-8")
		end
end

#Nscripter2用タグ登録
def Nscripter2Tag(output_filename, str)
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

def ScriptTagTask(input_filename, str, output_filename, flag)
	#指定したファイルの読込
	text = open("#{input_filename}.txt", "r+")
	str = text.read

	#各種エンジン用タグ登録へ分岐
	case flag

	#LINKS用タグ登録
	when 1
		LinksTag(output_filename, str)
	#ティラノスクリプト用タグ登録
	when 2
		TyranoTag(output_filename, str)
	#吉里吉里2用タグ登録
	when 3
		KirikiriTag(output_filename, str)
	#Nscripter2用タグ登録
	when 4
		Nscripter2Tag(output_filename, str)
	end
end

def GetFilename(filename, text)
	print text
	filename = gets.strip
end

#各種エンジン用タグ登録メソッド
def script_tag(flag, str)

	#ファイル名用変数
	input_filename, output_filename = nil, nil

	#ファイルの指定ループ
	loop do

		print "終了する場合は exit と入力してください\n"

		#変換したいファイル名の指定 & 変換後のファイル名の指定
		input_filename = GetFilename(input_filename, "タグを登録したいファイルを指定してください：")
		output_filename = GetFilename(output_filename, "タグ登録後のファイル名を入力してください:")

		# exitが含まれていた場合ループを抜ける
		if input_filename =~ /exit/ || output_filename =~ /exit/ then
			break
		end

		ScriptTagTask(input_filename, str, output_filename, flag)
	end
end