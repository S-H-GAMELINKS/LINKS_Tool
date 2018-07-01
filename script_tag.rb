# encoding: Windows-31J

#LINKS�p�^�O�o�^
def LinksTag(output_filename, str)
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
def TyranoTag(output_filename, str)
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

#�g���g���p�^�O�o�^
def KirikiriTag(output_filename, str)
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
def Nscripter2Tag(output_filename, str)
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

def ScriptTagTask(input_filename, str, output_filename, flag)
	#�w�肵���t�@�C���̓Ǎ�
	text = open("#{input_filename}.txt", "r+")
	str = text.read

	#�e��G���W���p�^�O�o�^�֕���
	case flag

	#LINKS�p�^�O�o�^
	when 1
		LinksTag(output_filename, str)
	#�e�B���m�X�N���v�g�p�^�O�o�^
	when 2
		TyranoTag(output_filename, str)
	#�g���g��2�p�^�O�o�^
	when 3
		KirikiriTag(output_filename, str)
	#Nscripter2�p�^�O�o�^
	when 4
		Nscripter2Tag(output_filename, str)
	end
end

def GetFilename(filename, text)
	print text
	filename = gets.strip
end

#�e��G���W���p�^�O�o�^���\�b�h
def script_tag(flag, str)

	#�t�@�C�����p�ϐ�
	input_filename, output_filename = nil, nil

	#�t�@�C���̎w�胋�[�v
	loop do

		print "�I������ꍇ�� exit �Ɠ��͂��Ă�������\n"

		#�ϊ��������t�@�C�����̎w�� & �ϊ���̃t�@�C�����̎w��
		input_filename = GetFilename(input_filename, "�^�O��o�^�������t�@�C�����w�肵�Ă��������F")
		output_filename = GetFilename(output_filename, "�^�O�o�^��̃t�@�C��������͂��Ă�������:")

		# exit���܂܂�Ă����ꍇ���[�v�𔲂���
		if input_filename =~ /exit/ || output_filename =~ /exit/ then
			break
		end

		ScriptTagTask(input_filename, str, output_filename, flag)
	end
end