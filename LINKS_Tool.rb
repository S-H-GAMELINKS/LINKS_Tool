# encoding: Windows-31J
#LINKS�p�X�N���v�g�^�O�ꊇ�ϊ��c�[��

#�@�\�I��p�ϐ�
flag = 0

#�Ǎ��ϐ�str�̒�`
str = String.new

#�t�@�C�����p�ϐ�
input_filename = nil
output_filename = nil

#�g�p����@�\�̑I��
while flag == 0

	print "�g�p����@�\��I�����Ă�������"
	print "1: LINKS�p�^�O�o�^, 2:�e�B���m�X�N���v�g�p�^�O�o�^, 3:�g���g��2�p�^�O�o�^, 4:Nscripter2�p�^�O�o�^"
	print "�g�p����@�\�́H�F"
	flag = gets.to_i
end

#LINKS�p�^�O�o�^
if flag == 1 then

	#�t�@�C���̎w�胋�[�v(LINKS)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#�ϊ��������t�@�C�����̎w��(LINKS)
		print "�^�O��o�^�������t�@�C�����w�肵�Ă��������F"
		input_filename = gets.strip

		#�ϊ���̃t�@�C�����w��(LINKS)
		print "�^�O�o�^��̃t�@�C��������͂��Ă�������:"
		output_filename = gets.strip
	end

	#�w�肵���t�@�C���̓Ǎ�(LINKS)
	text = open("#{input_filename}.txt", "r+")
	str = text.read

	#�^�O�̓o�^(LINKS)
	str.gsub!(/�B/, "�BP")
	str.gsub!(/�v/, "�vP")
	str.gsub!(/^$/, "R")
	str.gsub!(/^/, "L")
	str.gsub!(/LR/, "R")

	#�w�肵���t�@�C�����ŏo��(LINKS)
	File.open("#{output_filename}.txt", "w") do |file|
		file.write str
	end
end

#�e�B���m�X�N���v�g�p�^�O�o�^
if flag == 2 then

	#�t�@�C���̎w�胋�[�v(�e�B���m�X�N���v�g)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#�ϊ��������t�@�C�����̎w��(�e�B���m�X�N���v�g)
		print "�^�O��o�^�������t�@�C�����w�肵�Ă��������F"
		input_filename = gets.strip

		#�ϊ���̃t�@�C�����w��(�e�B���m�X�N���v�g)
		print "�^�O�o�^��̃t�@�C��������͂��Ă�������:"
		output_filename = gets.strip
	end

	#�w�肵���t�@�C���̓Ǎ�(�e�B���m�X�N���v�g)
	text = open("#{input_filename}.txt", "r+")
	str = text.read

	#�^�O�̓o�^(�e�B���m�X�N���v�g)
	str.gsub!(/$/, "[p]")
	str.gsub!(/�B/, "�B[l]")
	str.gsub!(/^\[p\]$/, "")
	str.gsub!(/\[l\]\[p\]$/, "[p]")

	#�w�肵���t�@�C�����ŏo��(�e�B���m�X�N���v�g)
	File.open("#{output_filename}.ks", "w") do |file|
		file.write str.encode("UTF-8")
	end
end

#�g���g��2�p�^�O�o�^
if flag == 3 then

	#�t�@�C���̎w�胋�[�v(�g���g��2)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#�ϊ��������t�@�C�����̎w��(�g���g��2)
		print "�^�O��o�^�������t�@�C�����w�肵�Ă��������F"
		input_filename = gets.strip

		#�ϊ���̃t�@�C�����w��(�g���g��2)
		print "�^�O�o�^��̃t�@�C��������͂��Ă�������:"
		output_filename = gets.strip
	end

	#�w�肵���t�@�C���̓Ǎ�(�g���g��2)
	text = open("#{input_filename}.txt", "r+")
	str = text.read

	#�^�O�̓o�^(�g���g��Z)
	str.gsub!(/$/, "[p]")
	str.gsub!(/�B/, "�B[l]")
	str.gsub!(/^\[p\]$/, "[cm]")
	str.gsub!(/\[l\]\[p\]$/, "[p]")

	#�w�肵���t�@�C�����ŏo��(�g���g��2)
	File.open("#{output_filename}.ks", "w") do |file|
		file.write str.encode("UTF-8")
	end
end

#Nscripter2�p�^�O�o�^
if flag == 4 then

	#�t�@�C���̎w�胋�[�v(Nscripter2)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#�ϊ��������t�@�C�����̎w��(Nscripter2)
		print "�^�O��o�^�������t�@�C�����w�肵�Ă��������F"
		input_filename = gets.strip

		#�ϊ���̃t�@�C�����w��(Nscripter2)
		print "�^�O�o�^��̃t�@�C��������͂��Ă�������:"
		output_filename = gets.strip
	end

	#�w�肵���t�@�C���̓Ǎ�(Nscripter2)
	text = open("#{input_filename}.txt", "r+")
	str = text.read

	#�^�O�̓o�^(Nscripter2)
	str.gsub!(/�B/, "�B\\p")
	str.gsub!(/�v/, "�v\\p")
	str.gsub!(/$/, "\\p")
	str.gsub!(/^\\p/, "")
	str.gsub!(/\\p\\p/, "\\p")

	#�w�肵���t�@�C�����ŏo��(Nscripter2)
	File.open("#{output_filename}.txt", "w") do |file|
		file.write str.encode("UTF-8")
	end
end
