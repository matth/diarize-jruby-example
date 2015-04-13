# diarize-jruby example

## Install dependencies

### jruby

    wget https://s3.amazonaws.com/jruby.org/downloads/1.7.19/jruby-bin-1.7.19.tar.gz

    tar xvzf jruby-bin-1.7.19.tar.gz

### Install diarize gem

    jruby-1.7.19/bin/jruby -S gem install diarize-jruby

## Run script

The example script shows some very basic usage of the diarize jruby 
(and hence LIUM). It outputs speaker segments with start, duration and speaker
id.

   jruby-1.7.19/bin/jruby example.rb example.wav


