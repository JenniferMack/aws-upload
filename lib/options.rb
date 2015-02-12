#!/usr/bin/env ruby
require 'optparse'

def get_options
    options = {}
    # defaults
    options[:keyfile] = File.expand_path("~/.gnupg/aws-s3.key")
    options[:bucket] = "jmdn-img"

    OptionParser.new do |opts|
        opts.banner = "usage: stuff"

        opts.on('-k', '--key-file FILE', 'Key file') do |op|
            options[:keyfile] = op 
        end

        opts.on('-b', '--bucket NAME', 'Bucket name') do |op|
            options[:bucket] = op
        end

        options[:help] = opts.help
    end.parse!
    
    return options
end

if (__FILE__ == $0)
    opts = get_options

    if opts[:keyfile].nil?
        puts "No key."
    elsif File.file?(opts[:keyfile])
        puts "Key ok."
    else
        puts "Key does not exist."
    end

    puts "Bucket: #{opts[:bucket]}"

    if ARGV.empty?
        puts "No files."
    end
end
