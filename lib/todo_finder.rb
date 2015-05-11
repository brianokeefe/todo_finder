require 'colorize'
require 'todo_finder/version'

module TodoFinder
  class Finder
    attr_accessor :matches

    def initialize
      @matches = Hash.new { |h,k| h[k]=[] }
    end

    # Find all TODOs in given dir and stuff them in a hash keyed by file
    def find(dir='.')
      full_dir = File.expand_path File.join(Dir.pwd, dir, '**', '*')
      all_files = Dir[full_dir].reject { |file| File.directory? file }

      all_files.each do |file_name|
        File.open(file_name, :encoding => 'ISO-8859-1') do |file|
          file.each_with_index do |line, i|
            @matches[file_name] << [i + 1, line] if line =~ /TODO/
          end
        end
      end

      return self
    end

    # Pretty output
    def output
      @matches.each do |file, lines|
        file_name = '.' << file.sub(Dir.pwd, '')
        puts file_name.yellow

        lines.each do |i, line|
          line_num = i.to_s.green
          formatted_line = line.sub(/(\*|\/\/|#)\s+?TODO:/, '')
          puts "  - [#{line_num}] " << formatted_line.strip
        end

        puts ''
      end
    end
  end
end
