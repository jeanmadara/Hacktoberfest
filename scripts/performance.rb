use_bpm 80
use_synth :mod_pulse
use_synth_defaults cutoff: 80, sub_detune: -24, amp: 0.7

live_loop :melodia do
  #A
  sleep 12+12+12+9
  play_pattern_timed [:a4, :e5,:a5, :e4,], [1, 0.5,1, 0.5]
  2.times do |i|
    play_pattern_timed [:a4, :a4, :b4, :c4, :d4], [0.5, 0.5, 0.5, 0.5, 1]
    play_pattern_timed [:a4, :a4, :r, :g5, :e5], [0.5, 1, 0.5, 0.5, 0.5]
    play_pattern_timed [:e5, :d4, :c4, :d4], [1, 0.5, 0.5, 1]
    if i == 0
      play_pattern_timed [:a4, :a4, :e4], [0.5, 2, 0.5]
    else
      play_pattern_timed [:a4, :a4, :r, :c4, :d4], [0.5, 1, 0.5, 0.5, 0.5]
    end
  end
  2.times do |i|
    play_pattern_timed [:e5, :e5, :g5, :g5], [ 1, 0.5,1, 0.5]
    play_pattern_timed [:a5, :e5, :r, :g5, :e5], [0.5, 1, 0.5, 0.5, 0.5]
    play_pattern_timed [:e5, :d4, :c4, :d4], [1, 0.5, 0.5, 1]
    if i == 0
      play_pattern_timed [:a4, :a4, :r, :c4, :d4], [0.5, 1, 0.5, 0.5,0.5]
    else
      play_pattern_timed [:a4, :a4, :r, :e4], [0.5, 1.5, 0.5, 0.5]
    end
  end
  #B
  2.times do |i|
    play_pattern_timed [:a5, :a5, :g5, :a5, :g5], [ 0.5,0.5, 0.5,1, 0.5]
    play_pattern_timed [:a5, :a5, :a5, :g5], [0.5, 1, 1, 0.5]
    play_pattern_timed [:a5, :a5, :g5, :a5, :g5], [0.5,0.5, 0.5,1, 0.5]
    if i == 0
      play_pattern_timed [:a5, :g5, :e5], [0.5, 2,0.5]
    else
      play_pattern_timed [:a5, :g5, :r, :c4, :d4], [0.5, 1, 0.5, 0.5, 0.5]
    end
  end
  2.times do |i|
    play_pattern_timed [:e5, :g5, :g5, :g5], [ 1,0.5, 1, 0.5]
    play_pattern_timed [:a5, :e5,:r, :g5, :e5], [0.5, 1, 0.5,0.5, 0.5]
    play_pattern_timed [:e5, :d4, :c4, :d4], [1, 0.5, 1, 0.5]
    if i == 0
      play_pattern_timed [:a4, :a4, :r, :c4, :d4], [0.5, 1, 0.5, 0.5, 0.5]
    else
      play_pattern_timed [:a4, :a4, :r], [0.5, 2, 0.5]
    end
  end
end

live_loop :ritmo_3_4 do
  with_fx :reverb,mix: 1,room: 0.8,amp: 1 do
    sample :drum_bass_hard
    sleep 1
    sample :drum_bass_hard
    sleep 0.5
    sample :drum_bass_soft
    sleep 0.5
    sleep 1 # Silencio en el tercer tiempo
  end
end
live_loop :ritmo do
  
  sync :ritmo_3_4
  with_fx :reverb,mix: 1,room: 0.8,amp: 2 do
    sleep 1
    sample :drum_cymbal_pedal
    sleep 0.5
    sample :drum_cymbal_pedal
    sleep 0.5
    sleep 1 # Silencio en el tercer tiempo
  end
end
solenoids = "C:/Users/jean_/Desktop/samples"
live_loop :dolores do
  stop
  sample solenoids, "dolores", beat_stretch: 12, rate: 1
  sleep 12
end

# Loop para un elemento rítmico suave con un platillo
live_loop :percussion do
  sample :drum_cymbal_soft, amp: 0.6, rate: 0.5  # Reproduce una muestra de platillo suave con amplificación reducida y una velocidad de reproducción más baja
  sleep 12 # Pausa de 16 segundos antes de repetir el loop
end

# Loop para la capa de fondo armónica con un sintetizador oscuro y ambiental
live_loop :pad do
  stop
  use_synth :dark_ambience  # Selecciona el sintetizador dark_ambience
  play_chord chord(:E2, :minor), amp: 0.5, sustain: 8, release: 4  # Toca un acorde de La menor (A minor) con sustain de 8 segundos y release de 4 segundos
  sleep 9  # Pausa de 8 segundos antes de repetir el loop
end
# Loop para una capa ambiental de fondo con acordes sostenidos
live_loop :background_ambience do
  stop
  use_synth :hollow  # Selecciona el sintetizador hollow
  play_chord chord(:E4, :minor), amp: 0.3, sustain: 16, attack: 4, release: 8  # Toca un acorde de La menor en una octava más alta con sustain de 16 segundos, attack de 4 segundos y release de 8 segundos
  sleep 9  # Pausa de 16 segundos antes de repetir el loop
end

# Loop para la línea de bajo, proporcionando una base armónica profunda
live_loop :bass do
  
  use_synth :fm  # Selecciona el sintetizador fm
  use_synth_defaults attack: 1, release: 4, depth: 2, divisor: 1.5  # Configura los parámetros por defecto del sintetizador fm
  play_chord chord(:A2, :minor).take(2), amp: 0.5, sustain: 8  # Toca las dos primeras notas del acorde de La menor (A1 y E2) con sustain de 8 segundos
  sleep 9  # Pausa de 8 segundos antes de repetir el loop
end



# Bucle para la entrada de audio
live_loop :entrada_audio do
  stop
  # Procesar la entrada de audio en tiempo real
  with_fx :reverb, room: 0.8, mix: 0.6 do
    with_fx :echo, phase: 0.25, decay: 2 do
      live_audio :V8, amp: 1.5  # Cambia :mic al nombre del dispositivo de entrada si es necesario
    end
  end
  sleep 3  # Pequeña pausa para evitar sobrecarga del procesador
end
