
if ARGV.empty?
  $stderr.puts "usage: #{File.basename(__FILE__)} audio-file.wav"
  exit 1
end

require 'diarize'

file  = File.absolute_path(ARGV[0])

audio = Diarize::Audio.new( URI('file:' + file) )

audio.analyze!( train_speaker_models = true )

segments = audio.segments.map do |segment|
  {
    :start    => segment.start,
    :duration => segment.duration,
    :speaker  => segment.speaker.uri.to_s.split('#').last,
  }
end

segments = segments.sort { |a,b| a[:start] <=> b[:start] }

puts "Start, Duration, Speaker"

segments.each do |s|
  puts "#{s[:start]},#{s[:duration]},#{s[:speaker]}"
end
