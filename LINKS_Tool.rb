# encoding: Windows-31J
#LINKS用スクリプトタグ一括変換ツール

#機能選択用変数
flag = 0

#読込変数strの定義
str = String.new

#ファイル名用変数
input_filename = nil
output_filename = nil

#使用する機能の選択
while flag == 0

	print "使用する機能を選択してください"
	print "1: LINKS用タグ登録, 2:ティラノスクリプト用タグ登録, 3:吉里吉里2用タグ登録, 4:Nscripter2用タグ登録"
	print "使用する機能は？："
	flag = gets.to_i
end

#LINKS用タグ登録
if flag == 1 then

	#ファイルの指定ループ(LINKS)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#変換したいファイル名の指定(LINKS)
		print "タグを登録したいファイルを指定してください："
		input_filename = gets.strip

		#変換後のファイル名指定(LINKS)
		print "タグ登録後のファイル名を入力してください:"
		output_filename = gets.strip
	end

	#指定したファイルの読込(LINKS)
	text = open("#{input_filename}.txt", "r+")
	str = text.read

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
if flag == 2 then

	#ファイルの指定ループ(ティラノスクリプト)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#変換したいファイル名の指定(ティラノスクリプト)
		print "タグを登録したいファイルを指定してください："
		input_filename = gets.strip

		#変換後のファイル名指定(ティラノスクリプト)
		print "タグ登録後のファイル名を入力してください:"
		output_filename = gets.strip
	end

	#指定したファイルの読込(ティラノスクリプト)
	text = open("#{input_filename}.txt", "r+")
	str = text.read

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

#吉里吉里2用タグ登録
if flag == 3 then

	#ファイルの指定ループ(吉里吉里2)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#変換したいファイル名の指定(吉里吉里2)
		print "タグを登録したいファイルを指定してください："
		input_filename = gets.strip

		#変換後のファイル名指定(吉里吉里2)
		print "タグ登録後のファイル名を入力してください:"
		output_filename = gets.strip
	end

	#指定したファイルの読込(吉里吉里2)
	text = open("#{input_filename}.txt", "r+")
	str = text.read

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
if flag == 4 then

	#ファイルの指定ループ(Nscripter2)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#変換したいファイル名の指定(Nscripter2)
		print "タグを登録したいファイルを指定してください："
		input_filename = gets.strip

		#変換後のファイル名指定(Nscripter2)
		print "タグ登録後のファイル名を入力してください:"
		output_filename = gets.strip
	end

	#指定したファイルの読込(Nscripter2)
	text = open("#{input_filename}.txt", "r+")
	str = text.read

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
