###########################################
## Ponencia para  Hacktober fest Guayaquil en U.Catolica
##  19 de oktubre 2024
## @jeanmadara
############################################

# #. juyayay

use_bpm 120
# Ritmo
live_loop :percusion do
  with_fx :compressor do
    4.times do
      sample  :bd_haus
      sleep 1
    end
  end
end

# progresión acordes
live_loop :chord_progression do
  stop
  use_synth :hollow # Puedes cambiar el sintetizador aquí si lo deseas
  # Progresión de acordes: C, Am, C, Am, F, G
  2.times do
    2.times do
      play_chord chord(:C, :major), sustain: 2 # Toca el acorde C mayor
      sleep 2
      play_chord chord(:A, :minor), sustain: 2# Toca el acorde A menor
      sleep 2
    end
    play_chord chord(:F, :major), sustain: 4# Toca el acorde F mayor
    sleep 4
    play_chord chord(:G, :major), sustain: 4 # Toca el acorde G mayor
    sleep 4
  end
  
end
live_loop :chord_progressionn do
  stop
  use_synth :hollow # Puedes cambiar el sintetizador si lo prefieres
  
  # Progresión de acordes: Bm, D, A, Bm, Bm, D, A, Bm, G
  6.times do
    play_chord chord(:B, :minor), sustain: 4, release: 0.5, amp: 1.5
    sleep 4
    play_chord chord(:D, :major), sustain: 4, release: 0.5, amp: 1.5
    sleep 4
    
    play_chord chord(:A, :major), sustain: 4, release: 0.5, amp: 1.5
    sleep 4
    play_chord chord(:B, :minor), sustain: 4, release: 0.5, amp: 1.5
    sleep 4
  end
  4.times do
    play_chord chord(:G, :major), sustain: 4, release: 0.5, amp: 1.5
    sleep 4
  end
  
  
end

sample_path = "C:/Users/jean_/Desktop/samples"
live_loop :play_track do
  stop
  sample sample_path, "año", amp: 0.5 # Ajusta el volumen con amp si es necesario
  sleep 16 # Duerme por la duración exacta del sample para evitar superposición
  # Detiene el loop una vez que termina el sample
  stop
end