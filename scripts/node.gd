extends Node

@export var audio_stream: AudioStream
@export var autoplay: bool = true
@export var volume_db: float = 0.0

var audio_player: AudioStreamPlayer

func _ready():
	# Cria o player de áudio
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	
	# Configura o player
	audio_player.stream = audio_stream
	audio_player.volume_db = volume_db
	audio_player.finished.connect(_on_audio_finished)
	
	# Inicia a reprodução se autoplay estiver ativado
	if autoplay and audio_stream != null:
		audio_player.play()

func _on_audio_finished():
	# Faz o loop da música
	audio_player.play()

func play_music():
	if audio_player:
		audio_player.play()

func stop_music():
	if audio_player:
		audio_player.stop()

func set_volume(new_volume_db: float):
	volume_db = new_volume_db
	if audio_player:
		audio_player.volume_db = volume_db
