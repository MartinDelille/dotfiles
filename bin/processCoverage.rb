#!/usr/bin/env ruby

require 'optparse'
require 'json'
require 'markaby'

payload = "payload.json"
root = "."
OptionParser.new do |opts|
  opts.banner = "Usage: processCoverage.rb [options]"
  opts.on("--payload FILE") { |o| payload = o }
  opts.on("--root DIR") { |o| root = o }
end.parse!

puts "Processing coverage data..."
data = File.read(payload)
js = JSON.parse(data)

total_line_count = 0
total_covered_lines = 0

mab = Markaby::Builder.new
mab.html do
  head do
    title 'Coverage report'
    link :rel => 'stylesheet', :media =>'screen, projection', :href => 'style.css'
  end
  body do
    h1 'Code coverage'

    js['source_files'].each do |file|
      p do
        a file['name'], :href => '#' + file['name']
      end
    end

    js['source_files'].each do |file|
      name = file['name']
      print name + ': '
      a '', :id => name
      h2 name
      coverage = file['coverage']
      not_covered_lines = 0
      covered_lines = 0
      line_number = 0
      pre do
        begin
          f = File.open(File.join(root, name), "r")
          f.read.each_line do |line|
            span.number line_number.to_s
            if coverage[line_number]
              if coverage[line_number].to_i == 0
                span.code.bad line
                not_covered_lines += 1
              else
                span.code.good line
                covered_lines += 1
              end
            else
              span.code line
            end
            span.cl ""
            line_number += 1
          end
          f.close
          puts covered_lines
        rescue
          puts "Error!"
        end
      end
      file_coverage = 0
      if covered_lines + not_covered_lines > 0
        file_coverage = 100 * covered_lines / (covered_lines + not_covered_lines)
      end
      p "Coverage for #{name} : #{file_coverage}% #{covered_lines}/#{covered_lines + not_covered_lines}"
      total_line_count += covered_lines + not_covered_lines
      total_covered_lines += covered_lines
    end
    total_coverage = 0
    if total_line_count > 0
      total_coverage = 100 * total_covered_lines / total_line_count
    end
    p "Total coverage : #{total_coverage}%"
  end
end

File.open("out.html", 'w') do |f|
  f.write mab.to_s
end

puts "Done!"
