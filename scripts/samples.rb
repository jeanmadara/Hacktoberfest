###########################################
## Ponencia para  Hacktober fest Guayaquil en U.Catolica
##  19 de oktubre 2024
## @jeanmadara
############################################

# #. Samples

use_bpm 80
path = "C:/Users/jean_/Desktop/samples"

live_loop :dolores do
  
  sample path, "dolores", amp: 0.8, rate: -1
  sleep 12
end

live_loop :percussion do
  
  sample :drum_cymbal_soft, amp: 0.6, rate: 0.5
  sleep 6
end

live_loop :pad do
  stop
  use_synth :dark_ambience
  play_chord chord(:e2, :minor), amp: 0.5, sustain: 8, release: 4  # Toca un acorde de La menor (A minor) con sustain de 8 segundos y release de 4 segundos
  sleep 9
end
live_loop :background_ambience do
  
  use_synth :hollow
  play_chord chord(:c4, :minor), amp: 0.4, sustain: 16, attack: 4, release: 8
  sleep 9
end

live_loop :bass do
  
  use_synth :fm
  use_synth_defaults attack: 1, release: 4, depth: 2, divisor: 1.5  # Configura los parámetros por defecto del sintetizador fm
  play_chord chord(:A1, :minor).take(2), amp: 0.5, sustain: 8
  sleep 9
end
