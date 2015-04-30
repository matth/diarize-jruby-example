require 'diarize'
require 'optparse'

################################################################################
# PARSE OPTS

usage       =  "usage: #{File.basename(__FILE__)} audio-file.wav"
output_file = $stdout

if ARGV.empty?
  $stderr.puts usage
  exit 1
else
  OptionParser.new do |opts|
    opts.banner = usage

    opts.on( '-o', '--output=FILE', 'Set output file' ) do |file|
      output_file = File.open( file, 'w' )
    end

    opts.on( '-h', '--help', 'Prints this message' ) do
      puts opts
      exit
    end
  end.parse!
end

################################################################################
# RUN

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

output_file.puts "Start, Duration, Speaker"

segments.each do |s|
  output_file.puts "#{s[:start]},#{s[:duration]},#{s[:speaker]}"
end
