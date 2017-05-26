# encoding: Windows-31J

#�e��G���W���p�^�O�o�^���\�b�h
def script_tag(flag, str)

	#�t�@�C�����p�ϐ�
	input_filename = nil
	output_filename = nil

	#�t�@�C���̎w�胋�[�v(Nscripter2)
	while input_filename == nil && output_filename == nil || input_filename == "" && output_filename == ""

		#�ϊ��������t�@�C�����̎w��(Nscripter2)
		print "�^�O��o�^�������t�@�C�����w�肵�Ă��������F"
		input_filename = gets.strip

		#�ϊ���̃t�@�C�����w��(Nscripter2)
		print "�^�O�o�^��̃t�@�C��������͂��Ă�������:"
		output_filename = gets.strip
	end

	#�w�肵���t�@�C���̓Ǎ�
	text = open("#{input_filename}.txt", "r+")
	str = text.read

	#�e��G���W���p�^�O�o�^�֕���
	case flag

	#LINKS�p�^�O�o�^
	when 1

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

	#�e�B���m�X�N���v�g�p�^�O�o�^
	when 2

		#�^�O�̓o�^(�e�B���m�X�N���v�g)
		str.gsub!(/$/, "[p]")
		str.gsub!(/�B/, "�B[l]")
		str.gsub!(/^\[p\]$/, "")
		str.gsub!(/\[l\]\[p\]$/, "[p]")

		#�w�肵���t�@�C�����ŏo��(�e�B���m�X�N���v�g)
		File.open("#{output_filename}.ks", "w") do |file|
			file.write str.encode("UTF-8")
		end

	#�g���g��2�p�^�O�o�^
	when 3

		#�^�O�̓o�^(�g���g��Z)
		str.gsub!(/$/, "[p]")
		str.gsub!(/�B/, "�B[l]")
		str.gsub!(/^\[p\]$/, "[cm]")
		str.gsub!(/\[l\]\[p\]$/, "[p]")

		#�w�肵���t�@�C�����ŏo��(�g���g��2)
		File.open("#{output_filename}.ks", "w") do |file|
			file.write str.encode("UTF-8")
		end

	#Nscripter2�p�^�O�o�^
	when 4

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
end