require_relative 'lib/fg_csv_processor'
require_relative 'lib/fg_csv_writer'

def usage
  puts 'usage: process-fg-csv fg-data.csv [use_tabs output-data.csv]'
end

if ARGV.length == 0
  usage
  exit
end

in_file = ARGV[0]
if !File.file?(in_file)
  puts "Input file does not exist: #{in_file}"
  puts 'Exiting...'
  exit 1
end
use_tabs = ARGV.length > 1 && ARGV[1].include?('_tab')
fg_csv = FgCsvProcessor.new(in_file, use_tabs)
puts "Processed #{fg_csv.to_s}"

out_index = use_tabs ? 2 : 1
if ARGV.length > out_index
  out_file = ARGV[out_index]
  out_cols = FgCsvWriter.instance.write_csv(out_file, fg_csv.data)
  puts "Wrote #{out_file} cols=#{out_cols}"
end
